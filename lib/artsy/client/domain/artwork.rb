module Artsy
  module Client
    module Domain
      class Artwork < Artsy::Client::Base
        def artist
          @artist ||= Artsy::Client::Domain::Artist.new(self[:artist]).tap do |artist|
            artist.instance = instance
          end
        end

        def title
          self[:title].gsub(/[\n]+/, "\n").strip
        end

        def to_s
          self[:display] || title
        end

        def to_ascii(options = {})
          @ascii ||= instance.artwork_txt(id, options)[:body]
        end
      end
    end
  end
end
