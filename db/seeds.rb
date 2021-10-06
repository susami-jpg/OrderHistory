# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OrderInformation.create!(
  name: 'test1',
  maker: 'a1',
  catalog_id: '132432',
  supplier: 'Laed1',
  delivered: false
  )

OrderInformation.create!(
  name: 'test2',
  maker: 'a2',
  catalog_id: '132435',
  supplier: 'Laed2',
  delivered: true,
  delivered_at: '2021-10-06'
  )

OrderInformation.create!(
  name: 'test3',
  maker: 'a3',
  catalog_id: '132482',
  supplier: 'Laed3',
  delivered: true,
  delivered_at: '2021-10-01'
  )