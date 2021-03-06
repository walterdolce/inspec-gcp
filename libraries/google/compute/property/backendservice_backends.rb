# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module Compute
    module Property
      class BackendServiceBackends
        attr_reader :balancing_mode

        attr_reader :capacity_scaler

        attr_reader :description

        attr_reader :group

        attr_reader :max_connections

        attr_reader :max_connections_per_instance

        attr_reader :max_rate

        attr_reader :max_rate_per_instance

        attr_reader :max_utilization

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @balancing_mode = args['balancingMode']
          @capacity_scaler = args['capacityScaler']
          @description = args['description']
          @group = args['group']
          @max_connections = args['maxConnections']
          @max_connections_per_instance = args['maxConnectionsPerInstance']
          @max_rate = args['maxRate']
          @max_rate_per_instance = args['maxRatePerInstance']
          @max_utilization = args['maxUtilization']
        end

        def to_s
          "#{@parent_identifier} BackendServiceBackends"
        end
      end

      class BackendServiceBackendsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return BackendServiceBackends.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| BackendServiceBackends.new(v, parent_identifier) }
        end
      end
    end
  end
end
