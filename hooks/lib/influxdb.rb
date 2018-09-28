module Hooky
  module Influxdb

    CONFIG_DEFAULTS = {
      # global settings
      before_deploy:                 {type: :array, of: :string, default: []},
      after_deploy:                  {type: :array, of: :string, default: []},
      hook_ref:                      {type: :string, default: "stable"},

      # InfluxDB Config

      # global
      reporting_disabled:            {type: :on_off, default: 'false'},
      
      # meta
      meta_log_enabled:              {type: :on_off, default: 'true'},
      
      # data
      data_index_version:            {type: :string, default: 'inmem'},
      data_cache_max_memory_size:    {type: :string, default: '1g'},
      data_cache_snapshot_memory_size:    {type: :string, default: '25m'},
      data_max_series_per_database:  {type: :integer, default: 1000000},
      data_max_values_per_tag:       {type: :integer, default: 100000},

      # http
      http_auth_enabled:             {type: :on_off, default: 'false'},
      http_log_enabled:              {type: :on_off, default: 'true'},
      http_suppress_write_log:       {type: :on_off, default: 'false'},
      http_write_tracing:            {type: :on_off, default: 'false'},
      http_pprof_enabled:            {type: :on_off, default: 'false'},
      http_max_row_limit:            {type: :integer, default: 100000},
      http_realm:                    {type: :string, default: 'InfluxDB'},
      http_shared_secret:            {type: :string, default: ''},
    }

  end
end
