require 'multi_json'

module Rulers
  module Model
    class FileModel
      @@cached_models = {}

      def initialize(filename)
        @filename = filename

        # If file name is 'dir/37.json', @id is 37
        basename = File.split(filename)[-1]
        @id = File.basename(basename, '.json').to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def save!
        File.open("db/quotes/#{@id}.json", 'w') do |f|
          f.write MultiJson.dump(@hash)
        end
     end

      def self.find(id)
        return @@cached_models[id.to_s] if @@cached_models.key?(id.to_s)

        file_model = FileModel.new("db/quotes/#{id}.json")

        @@cached_models[id.to_s] = file_model

        file_model
      end

      def self.find_all_by_submitter(submitter)
        all_file_models = FileModel.all
        all_file_models.select { |fm| fm['submitter'] == submitter }
      end

      def self.all
        files = Dir['db/quotes/*.json']
        files.map { |f| FileModel.new f }
      end

      def self.create(attrs)
        hash = {}
        hash['submitter'] = attrs['submitter'] || ''
        hash['quote'] = attrs['quote'] || ''
        hash['attribution'] = attrs['attribution'] || ''

        files = Dir['db/quotes/*.json']
        names = files.map { |f| File.split(f)[-1] }
        highest = names.map(&:to_i).max
        id = highest + 1

        File.open("db/quotes/#{id}.json", 'w') do |f|
          f.write <<~TEMPLATE
            {
              "submitter": "#{hash['submitter']}",
              "quote": "#{hash['quote']}",
              "attribution": "#{hash['attribution']}"
            }
          TEMPLATE
        end

        FileModel.new "db/quotes/#{id}.json"
      end
    end
  end
end
