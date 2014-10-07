require "spec_helper"
describe Order do
  # it "checks pay_type" do
  #   Contact.by_type('check').should eq 'check'
  # end
  it "checks pay_type" do
    Order.check_abc.to_sql.should include("WHERE \"orders\".\"pay_type\" = 'check'")
  end

  describe "check by type "do

    before :each do
      @pay_type = FactoryGirl.create(:order,pay_type:'check')
    end

    context "check for type" do
      it "checks by_type" do
        debugger
        Order.by_type('check').to_sql.should include("WHERE \"orders\".\"pay_type\" = 'check'")
      end
    end

    context "matching type" do
      it "matches by_type" do
        Order.match_by_type.to_sql.should_not include("WHERE \"orders\".\"pay_type\" = 'credit card'")
       end
    end
  end
end
