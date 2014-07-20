# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki, :class => 'Wikis' do
    title "MyString"
    body "MyText"
  end
end
