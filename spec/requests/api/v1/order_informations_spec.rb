require 'rails_helper'

describe 'OrderHistory API' do
  it '全ての発注履歴を取得する' do
    FactoryBot.create_list(:order_information, 10)

    get "/api/v1/order_informations"
    json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(json['data'].length).to eq 10
  end

  it '特定の発注履歴を取得する' do
    order_information = FactoryBot.create(:order_information)

    get "/api/v1/order_informations/#{order_information.id}"
    json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(json['data']['name']).to eq order_information.name
    expect(json['data']['maker']).to eq order_information.maker
    expect(json['data']['catalog_id']).to eq order_information.catalog_id
    expect(json['data']['supplier']).to eq order_information.supplier
    expect(json['data']['delivered']).to eq order_information.delivered
    expect(json['data']['delivered_at']).to eq order_information.delivered_at
  end

  it '新しい発注履歴を作成する' do
    valid_params = { name: 'test_kit', maker: 'waken', catalog_id: '13234', supplier: 'test', delivered: false }

    expect { post "/api/v1/order_informations", params: { order_information: valid_params } }.to change(OrderInformation, :count).by(+1)
    expect(response.status).to eq 200
  end

  it '発注履歴の編集を行う' do
    order_information = FactoryBot.create(:order_information)

    put "/api/v1/order_informations/#{order_information.id}", params: { order_information: { delivered: true, delivered_at: '2021-10-06' } }
    json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(json['data']['delivered']).to eq true
    expect(json['data']['delivered_at']).to eq '2021-10-06'
  end

  it '発注履歴を削除する' do
    order_information = FactoryBot.create(:order_information)
    
    expect { delete "/api/v1/order_informations/#{order_information.id}" }.to change(OrderInformation, :count).by(-1)

    expect(response.status).to eq 200
  end
end