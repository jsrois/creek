class ClassNode
 attr_accessor :type,:name,:body
 def initialize(data)
  @type = data[:type]
  @name = data[:name]
  @body = data[:body]
 end 
 def inspect
  "#{@type} #{@name} contains #{@body}"
 end  
end


filename = ARGV[0]

text = String.new;
File.foreach(ARGV[0]) { |line| text << line }

text.scan(/(?<label>struct|class)\s+(?<classname>[a-zA-Z]+)\s*(?<match>{((\g<match>|[^{}]*))*});/m).each do |m|
 node = ClassNode.new({type: m[0], name: m[1], body: m[2]})
 puts node.inspect 
end
