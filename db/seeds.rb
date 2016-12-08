# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.upto(10) do |itr|
  origin = %w(manual device).sample
  metrics = {
    steps: ['count', Random.rand(1000)],
    spo2: ['percent', Random.rand(100)],
    duration: ['seconds', Random.rand(10_000)],
    relationship_to_meal: [nil, %w(Before After Fasting)],
    distance: ['meters', Random.rand(10.0..100.0)]
  }

  s = Summary.create(date: Date.today - itr,
                     category: 'daily',
                     customer_id: "customer_id_#{itr}",
                     user_id: "user_id_#{itr}",
                     uid: "uid_#{itr}",
                     origin: origin,
                     source: %w(fitbit ihealth withings).sample,
                     device_type: %w(dev_type_a dev_type_b dev_type_c).sample,
                     device_name: %w(devA devB decC).sample)

  metric_keys = metrics.keys.sample(Random.rand(1..3))
  metric_keys.each do |key|
    data = { type: key, unit: metrics[key][0], value: metrics[key][1], origin: origin }
    s.metrics.create(data: data)
  end
end
