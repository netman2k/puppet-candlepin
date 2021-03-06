require 'spec_helper'

describe 'candlepin' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { should compile.with_all_deps }
      it { should contain_class('candlepin::install') }
      it { should contain_class('candlepin::config') }
      it { should contain_class('candlepin::database') }
      it { should contain_class('candlepin::service') }
      it { should contain_service('tomcat').with_ensure('running') }
    end
  end
end
