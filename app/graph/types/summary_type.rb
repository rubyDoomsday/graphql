# app/graph/types/summary_type.rb
TimeStandardsEnum = GraphQL::EnumType.define do
  name "TimeStandards"
  description 'the available time standards we support'

  value('local', 'time in user local time', value: :local)
  value('utc',   'user local time as utc', value: :utc)
end

SummaryType = GraphQL::ObjectType.define do
  name 'SummaryType'
  description 'A Validic Summary Object'

  field :record_id,  types.String, 'the id of the record',        resolve: -> (o, _a, _c) { o.id }
  field :created_at, types.String, 'creation date of the record', resolve: -> (o, _a, _c) { o.created_at }
  field :updated_at, types.String, 'updated date of the record',  resolve: -> (o, _a, _c) { o.updated_at }
  field :source,     SourceType,   'source information',          resolve: -> (o, _a, _c) { o }

  # metrics
  field :metrics do
    type MetricType
    description 'source information'
    resolve -> (obj, _a, _c) do
      metrics_as_hash = obj.metrics.map { |m| [m.data['type'], m] }.to_h
      OpenStruct.new(data: metrics_as_hash)
    end
  end

  # timestamp
  field :timestamp do
    type TimeType
    description 'time information'

    argument :standard, TimeStandardsEnum, 'local | utc', default_value: :utc

    resolve -> (obj, args, _c) do
      OpenStruct.new(type:   args[:standard],
                     time:   obj.date.to_time(args[:standard]),
                     offset: obj.date.to_time(:local).utc_offset)
    end
  end
end
