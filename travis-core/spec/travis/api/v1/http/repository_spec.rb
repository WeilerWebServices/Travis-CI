require 'spec_helper'

describe Travis::Api::V1::Http::Repository do
  include Travis::Testing::Stubs, Support::Formats

  let(:data) { Travis::Api::V1::Http::Repository.new(repository).data }

  it 'data' do
    data.except('public_key').should == {
      'id' => repository.id,
      'slug' => 'svenfuchs/minimal',
      'description' => 'the repo description',
      'last_build_id' => repository.last_build_id,
      'last_build_number' => repository.last_build_number,
      'last_build_started_at' => json_format_time(Time.now.utc - 1.minute),
      'last_build_finished_at' => json_format_time(Time.now.utc),
      'last_build_status' => 0, # still here for backwards compatibility
      'last_build_result' => 0,
      'last_build_language' => nil,
      'last_build_duration' => 60
    }
  end

  it 'public_key' do
    data['public_key'].should =~ /-----BEGIN.*PUBLIC KEY-----/
  end
end
