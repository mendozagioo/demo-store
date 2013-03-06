require "minitest_helper"

describe Product do
  before do
    @product = Product.new
  end

  it "must be valid" do
    @product.valid?.must_equal true
  end
end
