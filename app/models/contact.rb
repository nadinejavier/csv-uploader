class Contact < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        Contact.create! row.to_hash
    end
  end
end

