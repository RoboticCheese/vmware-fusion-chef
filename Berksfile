# encoding: utf-8

source 'https://supermarket.chef.io'

metadata

group :test do
  cookbook 'resource_vmware_fusion_test',
           path: 'spec/support/cookbooks/resource_vmware_fusion_test'
  cookbook 'resource_vmware_fusion_app_test',
           path: 'spec/support/cookbooks/resource_vmware_fusion_app_test'
  cookbook 'resource_vmware_fusion_config_test',
           path: 'spec/support/cookbooks/resource_vmware_fusion_config_test'
end

group :integration do
  cookbook 'vmware-fusion_test',
           path: 'test/fixtures/cookbooks/vmware-fusion_test'
end
