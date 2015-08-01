# Encoding: UTF-8
#
# Cookbook Name:: vmware-fusion
# Library:: provider_vmware_fusion_config
#
# Copyright 2015 Jonathan Hartman
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

require 'chef/provider/execute'
require_relative 'provider_vmware_fusion'
require_relative 'resource_vmware_fusion_config'

class Chef
  class Provider
    # A Chef provider for VMWare Fusion configuration. Since that config is
    # just an initialization script, build based off an execute resource.
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class VmwareFusionConfig < Provider::Execute
      provides :vmware_fusion_config, platform_family: 'mac_os_x'

      alias_method :action_create, :action_run

      private

      #
      # Overload the command string to call the VMware initialization tool.
      #
      # (see Execute#command)
      #
      def command
        path = ::File.join(VmwareFusion::PATH,
                           'Contents/Library/Initialize VMware Fusion.tool')
        "#{path.gsub(' ', '\\ ')} set '' '' '' '#{new_resource.license}'"
      end

      #
      # Redact the license key from the command's description.
      #
      # (see Execute#description)
      #
      def description
        if new_resource.license.nil?
          super
        else
          super.gsub(new_resource.license, '*' * 16)
        end
      end
    end
  end
end
