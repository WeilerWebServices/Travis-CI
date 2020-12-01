# https://github.com/guilleiguaran/rails/blob/735a9ed6358b5b8d3d74cd140cad086bf5663029/activesupport/lib/active_support/core_ext/securerandom.rb

require 'securerandom'

module SecureRandom
  def self.uuid
    ary = self.random_bytes(16).unpack("NnnnnN")
    ary[2] = (ary[2] & 0x0fff) | 0x4000
    ary[3] = (ary[3] & 0x3fff) | 0x8000
    "%08x-%04x-%04x-%04x-%04x%08x" % ary
  end unless respond_to?(:uuid)
end
