# app/graph/types/device_type.rb
DeviceType = GraphQL::ObjectType.define do
  name 'DeviceType'
  description 'contains information about device origin'

  field :type,   types.String, 'device type',        resolve: -> (o, _a, _c) { o.device_type }
  field :name,   types.String, 'name of the device', resolve: -> (o, _a, _c) { o.device_name }
end
