class StaticPagesController < ApplicationController
  def welcome
  end

  def product
  end

  def nutrition
  end

  def privacy_policy
  end

  def return_policy
  end

  def subscribed
  end

  def faq
  end

  def about
  end

  def shop
    redirect_to 'store/products/yuve-nutritional-shake'
  end
end
