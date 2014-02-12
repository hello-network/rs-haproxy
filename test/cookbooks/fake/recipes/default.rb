#
# Cookbook Name:: fake
# Recipe:: default
#
# Copyright (C) 2013 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "machine_tag::default"

ts = Time.now

tags = [
  "server:uuid=#{node["rightscale"]["instance_uuid"]}",
  "database:active=true",
  "database:master_active=#{ts}",
  "database:lineage=#{node['rs-mysql']['lineage']}",
  "database:bind_ip_address=#{node['mysql']['bind_address']}",
  "database:bind_port=#{node['mysql']['port']}"
]

tags.each do |tag|
  mt = machine_tag tag do
    action :nothing
  end
  mt.run_action (:create)
end
