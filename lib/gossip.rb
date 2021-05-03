class Gossip 
    
    attr_reader :author, :content
    
    def initialize(author, content)
        @author = author
        @content = content     
    end
    
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        
        end
      
    end
   
    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
            end
        return all_gossips
    end

    def self.find(id)
        all_gossips = self.all
        g = id.to_i
        g = g - 1          
        return all_gossips[g]
    end

    def self.edit(id, author, content)
        all_gossips = self.all
        g = id.to_i - 1
        

        
        
    end    
    
end
      