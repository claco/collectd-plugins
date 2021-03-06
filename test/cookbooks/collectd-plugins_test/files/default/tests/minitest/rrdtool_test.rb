#
# Cookbook Name:: collectd-plugins_test
# Recipe:: rrdtool
#
# Copyright 2012-2013, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative "./support/helpers"

describe_recipe "collectd-plugins_test::rrdtool" do
  include CollectdPluginsTestHelpers

  describe "collectd_plugin" do
    let(:plugin) { file("/etc/collectd/plugins/rrdtool.conf") }

    it "should create a collectd rrdtool configuration file" do
      plugin.must_exist
    end

    it "should set the data_dir option" do
      plugin.must_include 'DataDir "' + File.join(node[:collectd][:platform][:collectd_base_dir], "rrd") + '"'
    end

    it "should set the cache_flush option" do
      plugin.must_include 'CacheFlush 120'
    end

    it "should set the writes_per_second option" do
      plugin.must_include 'WritesPerSecond 75'
    end

  end
end
