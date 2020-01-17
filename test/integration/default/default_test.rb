# InSpec test for recipe mongo_cookbook_new::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
# describe port(22) do
#   it { should be_listening }
# end

describe package 'mongodb-org' do
  it { should be_installed }
  its("version"){should match /4\./}
end

describe service 'mongod' do
  it { should be_running }
  it { should be_enabled }
end

describe port(27017) do #check mongodb port is working
  it { should be_listening }
end
