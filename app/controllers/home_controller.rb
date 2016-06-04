class HomeController < ApplicationController
  def index
    render locals: { codes: codes }
  end

  private

  def codes
    1.upto(100).map { CouponCode.generate }.uniq
  end
end
