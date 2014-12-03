class ClassNode
 attr_accessor :type,:name,:body,:functs
 def initialize(data)
  @type = data[:type]
  @name = data[:name]
  @body = data[:body]
  #parse functions!
  @functs = body.scan(/[a-zA-Z]+\s+([^\(\s]+)\s*\(([^\)]*)\)/m)
  
 end 
 def inspect
  "#{@type} #{@name} contains \n#{@body} \n with functions #{@functs}"
 end  
end


filename = ARGV[0]

text = String.new;
File.foreach(ARGV[0]) { |line| text << line }

text.scan(/(?<label>struct|class)\s+(?<classname>[a-zA-Z]+)\s*(?<match>{((\g<match>|[^{}]*))*});/m).each do |m|
 node = ClassNode.new({type: m[0], name: m[1], body: m[2]})
 puts node.inspect 
end
