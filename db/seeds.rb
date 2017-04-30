# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Plane.delete_all
History.delete_all

Plane.create(name: 'General Dynamics F-111')
Plane.create(name: 'Douglas AD Skyraider')
Plane.create(name: 'Aerojet General X-8')
Plane.create(name: 'Fairey Swordfish (built by Blackburn)')
Plane.create(name: 'McDonnell Douglas F-15 Eagle')
Plane.create(name: 'artin B-57 Canberra')
Plane.create(name: 'Cessna UC-78 Bobcat')
Plane.create(name: 'McDonnell Douglas F-4 Phantom II')
Plane.create(name: 'Lockheed P-38 Lightning with glass nose', status: 'departed')
Plane.create(name: 'Hughes OH-6 Cayuse', status: 'departed')