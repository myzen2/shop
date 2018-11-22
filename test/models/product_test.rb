require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  test "product price must be greater than or equal to 1" do
    product = Product.new(
      title: "Some product",
      description: "some desc",
      price: 0,
      image_url: "abc.jpg"
    )

    assert product.invalid?
    assert_equal ["must be greater than or equal to 1"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "product image_url must end with .jpg, .gif or .png regardless of the case" do
    product = products(:one)
    valids = %w(foo.jpg foo.gif foo.png foo.JPG foo.GIF foo.PNG http://foo.bar/baz/some.jpg)
    invalids = %w(foo.xls foo.gif.exe)

    invalids.each do |url|
      product.image_url = url
      assert product.invalid?
      assert_equal ["doit être au format jpg, png ou gif"], product.errors[:image_url]
    end

    valids.each do |url|
      product.image_url = url
      assert product.valid?
    end
  end
  


end
