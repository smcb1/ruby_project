require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")

class TestManufacturer < MiniTest::Test

  def setup()
    @manufacturer_1 = Manufacturer.new({
      "contact_name" => "Nashville Banjo Company",
      "contact_address" => "1 Wood Drive. Nashville, Tenessee. USA",
      "list_cost" => 1399
      })
    end

    def test_manufacturer_has_contact_name()
      assert_equal("Nashville Banjo Company", @manufacturer_1.contact_name)
    end

    def test_manufacturer_has_contact_address()
      assert_equal("1 Wood Drive. Nashville, Tenessee. USA", @manufacturer_1.contact_address)
    end

    def test_manufacturer_has_list_cost()
      assert_equal(1399, @manufacturer_1.list_cost.to_f)
    end

end
