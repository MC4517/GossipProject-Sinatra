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

    def self.edit(id, gossip_content)
        
        n = id.to_i - 1
        gossips = self.all
        CSV.open("./db/gossip.csv", "w") do |csv|
          gossips.each.with_index do |x| 
            if n == gossips.index(x)
              csv << [x.author, gossip_content]
            else
              csv << [x.author, x.content]

            end    
    
        end
end
end
end