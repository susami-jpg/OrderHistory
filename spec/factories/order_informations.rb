FactoryBot.define do
  factory :order_information do
    name { 'sample kit' }
    maker { 'active motif' }
    catalog_id { '23524' }
    supplier { 'nakalai' }
    delivered { false }
  end
end