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
require 'gcp_backend'
class Triggers < GcpResourceBase
  name 'google_cloudbuild_triggers'
  desc 'Trigger plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:disableds, field: :disabled)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:substitutions, field: :substitutions)
  filter_table_config.add(:filenames, field: :filename)
  filter_table_config.add(:ignored_files, field: :ignored_files)
  filter_table_config.add(:included_files, field: :included_files)
  filter_table_config.add(:trigger_templates, field: :trigger_template)
  filter_table_config.add(:builds, field: :build)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('triggers')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params)
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'id' => ->(obj) { return :id, obj['id'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'disabled' => ->(obj) { return :disabled, obj['disabled'] },
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'substitutions' => ->(obj) { return :substitutions, obj['substitutions'] },
      'filename' => ->(obj) { return :filename, obj['filename'] },
      'ignoredFiles' => ->(obj) { return :ignored_files, obj['ignoredFiles'] },
      'includedFiles' => ->(obj) { return :included_files, obj['includedFiles'] },
      'triggerTemplate' => ->(obj) { return :trigger_template, GoogleInSpec::CloudBuild::Property::TriggerTriggerTemplate.new(obj['triggerTemplate'], to_s) },
      'build' => ->(obj) { return :build, GoogleInSpec::CloudBuild::Property::TriggerBuild.new(obj['build'], to_s) },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://cloudbuild.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/triggers'
  end
end
