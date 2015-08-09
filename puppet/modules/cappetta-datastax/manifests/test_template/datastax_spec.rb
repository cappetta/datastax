require 'spec_helper'

describe 'datastax::params' do
  # Sudo code tests first, then
  #   build logic, rinse & repeat.
  #1. Validate nodes are up
  #2. validate processes are running
  #3. check cassandra log for errors

  let(:title){ 'Check Parameters' }
  it { should contain_class('datastax')}
  it { should be boolean - $autoupdate }


end
