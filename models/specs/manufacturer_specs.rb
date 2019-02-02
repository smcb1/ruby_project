require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")

class TestManufacturer < MiniTest::Test

  def setup()
    @manufacturer_1 = Manufacturer.new({
      "name" => "Nashville Banjo Company",
      "product_type" => "Banjo",
      "contact" => "1 Wood Drive. Nashville, Tenessee. USA",
      "cost" => 1399
      })
    end

    def test_manufacturer_has_name()
      assert_equal("Nashville Banjo Company", @manufacturer_1.name)
    end

    def test_manufacturer_has_product_type()
      assert_equal("Banjo", @manufacturer_1.product_type)
    end

    def test_manufacturer_has_contact()
      assert_equal("1 Wood Drive. Nashville, Tenessee. USA", @manufacturer_1.contact)
    end

    def test_manufacturer_has_cost()
      assert_equal(1399, @manufacturer_1.cost)
    end

end
