namespace :populate do
  desc "Populate activity type data"
  task orders: :environment do
    puts "Start rake task..."
    Order.transaction do
      (1..100).each do |i|
        Order.create(:name => "Customer #{i}", :address => "#{i} Main Street",
        :email => "customer-#{i}@example.com", :pay_type => "check")
      end
    end
    puts "End rake task..."
  end
end
