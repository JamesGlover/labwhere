FactoryGirl.define do
  factory :user do
    sequence(:login) {|n| "User:#{n}" }
    swipe_card { "SwipeCard:#{login}" }
    barcode { "Barcode:#{login}" }
    team

    factory :admin, class: "Admin" do
    end

    factory :standard, class: "Standard" do
    end
  end

end