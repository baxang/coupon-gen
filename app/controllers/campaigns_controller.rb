class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :redeem_code]

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    render locals: { campaign: @campaign}
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def redeem_code
    msg = []
    user_code = params[:code]

    code = @campaign.codes.find_by(code: user_code)

    unless code
      msg << 'Code not found.'
    else
      if code.redeemed?
        msg << 'Code already redeemed.'
      end

      unless code.redeem
        msg << 'Code redeem failed.'
      end
    end

    msg << 'Code was successfully redeemed.' if msg.empty?

    redirect_to @campaign, notice: msg.join(', ')
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end
