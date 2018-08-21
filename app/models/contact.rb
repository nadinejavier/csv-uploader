class Contact < ApplicationRecord
  # attr_accessor :first_name, :last_name, :phone_number, :email
  def self.to_csv
    attributes = %w{id first_name last_name phone_number email}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |contact|
        csv << attributes.map { |attr| contact.send(attr)  }
      end
    end
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact = find_by_id(row["id"]) || new
        contact.attributes = row.to_hash.slice(*accessible_attributes)
        contact.save!
    end
  end
end

