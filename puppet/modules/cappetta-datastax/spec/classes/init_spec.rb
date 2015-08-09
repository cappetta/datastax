require 'spec_helper'
describe 'datastax' do

  context 'with defaults for all parameters' do
    it { should contain_class('datastax') }
  end
end
