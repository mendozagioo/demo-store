require "minitest_helper"

describe Backend::Product do
  before do
    @product = Backend::Product.new
  end

  it "must be valid" do
    @product.valid?.must_equal true
  end
end
