# InSpec test for recipe mongod::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end
describe service 'mongod' do
  it {should be_running}
  it {should be_installed}
end
describe package('mongodb-org') do
  its('version') {should eq '3.2.18'}
end
