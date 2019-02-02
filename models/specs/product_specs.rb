require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")

class TestProduct < MiniTest::Test

  def setup()
    @product_1 = Product.new({
      "name" => "Nashville",
      "product_type" => "Banjo",
      "description" => "Nashville 5 string Banjo. Handmade in the USA.",
      "price" => 1500,
      "quantity" => 5
      })
    end

    def test_product_has_name()
      assert_equal("Nashville", @product_1.name)
    end

    def test_product_has_product_type()
      assert_equal("Banjo", @product_1.product_type)
    end

    def test_product_has_description()
      assert_equal("Nashville 5 string Banjo. Handmade in the USA.", @product.description)
    end

    def test_product_has_price()
      assert_equal(1500, @product_1.price)
    end

    def test_manufacturer_has_quantity()
      assert_equal(5, @product_1.quantity)
    end

end
