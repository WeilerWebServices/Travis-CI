require 'spec_helper'
require 'stringio'

describe Travis::Topaz do
  let(:url) { 'http://test.com' }
  let(:topaz) { Travis::Topaz.new(url, Logger.new(StringIO.new)) }

  describe '#update' do

    let(:event) { { sample: "event" } }

    describe 'Queue has less than 100 waiting updates' do
      it 'sends post request to topaz app' do
        topaz.update(event)
        sleep 0.1
        expect(a_request(:post, "http://test.com/event/new")).to have_been_made.once
      end
    end

    describe 'Queue has 100 or more waiting updates' do
      before do
        topaz.queue.stub(:num_waiting).and_return(101)
      end
      it 'does not post request topaz app' do
        topaz.update(event)
        sleep 0.1
        expect(a_request(:post, "https://test.com/event/new")).not_to have_been_made
      end
    end

  end
end
