require 'spec_helper'

describe 'node1' do
  # Sudo code tests first, then
  #   build logic, rinse & repeat.
  #1. Validate nodes are up
  #2. validate processes are running
  #3. check cassandra log for errors

  let(:title){ 'This is my fancy title ;) ' }
  it { should contain_class('datastax')}
  it { should contain puppet config files ('pwd')}


end
