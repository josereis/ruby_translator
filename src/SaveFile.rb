class SaveFile
    def self.read(filename)
        if File.exists?(filename)
            return File.readlines(filename)
        else
            return "The file name '#{filename}' does not exist!"
        end
    end

    def self.save(text)
        filename = Time.new.strftime('%d-%m-%y_%H:%M').to_s + '.txt'

        File.open(filename, 'w') do |line|
            line.puts(text)
        end
    end
end