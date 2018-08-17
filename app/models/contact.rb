class Contact < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(File.open(file.path, "rb:UTF-16BE")) do |row|
        Contact.create! row.to_hash
    end
  end
end

