module Olala
  class Label < ActiveRecord::Base
    translates :content, fallback: :any

    def self.retrieve(label, default = nil)
      if default.nil?
        label = Digest::MD5.hexdigest(label)
        default = 'undefined'
      end

      entry = self.where(label: label).first
      if !entry
        entry = Label.create! label: label, content: default
      end
      [label, entry.content.to_s.html_safe]
    end
  end

end