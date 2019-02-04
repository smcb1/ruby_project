require("minitest/autorun")
require("minitest/rg")
require_relative("../manufacturer")
require_relative("../product")
require_relative("../category")

class TestCategory < MiniTest::Test

  def setup()
    @category_1 = Category.new({
      "category_type" => "Banjo"
      })
    end

    def test_category_type()
      assert_equal("Banjo", @category_1.category_type)
    end

end
