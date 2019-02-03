require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")
require_relative("../inventory")

class TestInventory < MiniTest::Test

  def setup()
    @inventory = Inventory.new({
      "name" => "Nashville Banjo Company",
      "product_type" => "Banjo",
      "contact" => "1 Wood Drive. Nashville, Tenessee. USA",
      "cost" => 1399
      })
    end

end
