module ZenGarden
  class EnvFile
    attr_reader :location

    def initialize location=".env"
      @location = location

      raise ArgumentError, "Env file not found" unless exists?
    end

    def exports
      contents.select { |line| line =~ /\Aexport\s/ }
               .map { |line| line.gsub(/\Aexport\s/, '').split '=' }
               .reduce({}) { |hash,(key,value)| hash.merge key => value }
    end

    def contents
      @contents ||= File.read(location).split "\n"
    end

    private
    def exists?
      File.exists? location
    end
  end
end
