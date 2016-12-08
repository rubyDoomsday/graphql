# app/graph/types/metric_type.rb
UnitTypesEnum = GraphQL::EnumType.define do
  name 'UnitTypes'
  description 'Metric unit types'

  value('meter', 'default unit of measure', value: :meter)
  value('mile',  'convert to miles',        value: :mile)
  value('cm',    'convert to centimeters',  value: :cm)
end

MetricType = GraphQL::ObjectType.define do
  name 'MetricType'
  description 'The Validic Core API supports different metrics types to standardize data'

  # IntegerType
  field :steps do
    type IntegerType
    description 'Total steps counted to date'
    resolve -> (o, _a, _c) { o.data['steps'] if o.data['steps'].present? }
  end

  # IntegerType
  field :spo2 do
    type IntegerType
    description 'Total steps counted to date'
    resolve -> (o, _a, _c) { o.data['spo2'] if o.data['spo2'].present? }
  end

  # FloatType
  field :distance do
    type FloatType
    description 'Total steps counted to date'

    argument :unit_type,
             UnitTypesEnum,
             UnitTypesEnum.values.keys.join(' | '),
             default_value: UnitTypesEnum.values['meter'].value

    resolve -> (obj, args, _c) do
      return unless obj.data['distance'].present?

      converted_value = Unitwise(obj.data['distance'].data['value'], 'meter')
                        .convert_to(args[:unit_type].to_s).value.to_f

      OpenStruct.new(id: obj.data['distance'].id,
                     summary_id: obj.data['distance'].summary_id,
                     created_at: obj.data['distance'].created_at,
                     updated_at: obj.data['distance'].updated_at,
                     data: { 'unit'   => args[:unit_type].to_s,
                             'origin' => obj.data['distance'].data['origin'],
                             'value'  => converted_value })
    end
  end

  # NotAvailable
  field :foo do
    type FloatType
    description 'a field that doesn\'t exist'
    resolve -> (o, _a, _c) { o.data['foo'] if o.data['foo'].present? }
  end
end
