require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")

class TestProduct < MiniTest::Test

  def setup()
    @product_1 = Product.new({
      "name" => "Nashville",
      "manufacturer_id" => 1,
      "product_type" => "Banjo",
      "description" => "Nashville 5 string Banjo. Handmade in the USA.",
      "price" => 1500,
      "quantity" => 5,
      "url" => "images/nashville_banjo.jpg"
      })
    end

    def test_product_has_name()
      assert_equal("Nashville", @product_1.name)
    end

    def test_product_has_manufacturer_id()
      assert_equal(1, @product_1.manufacturer_id.to_i)
    end

    def test_product_has_product_type()
      assert_equal("Banjo", @product_1.product_type)
    end

    def test_product_has_description()
      assert_equal("Nashville 5 string Banjo. Handmade in the USA.", @product_1.description)
    end

    def test_product_has_price()
      assert_equal(1500, @product_1.price.to_f)
    end

    def test_product_has_quantity()
      assert_equal(5, @product_1.quantity.to_i)
    end

    def test_product_has_url
      assert_equal("images/nashville_banjo.jpg", @product_1.url.to_s)
    end

end
