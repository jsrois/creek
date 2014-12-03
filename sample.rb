class ClassNode
 attr_accessor :type,:name,:functs
 attr_writer :body
 
 def parse_body(body)
  @functs = Hash.new(0)
  body.scan(/([a-zA-Z]+)\s+([^\(\s]+)\s*\(([^\)]*)\)/m).each do |m|
    #          ^ retval        ^ name         ^ params 
    @functs[m[1].to_sym] = {:retval => m[0], :parameters => m[2].split(/\s*,\s*/)}
  end
 end 
 
 def initialize(data)
  @type = data[:type]
  @name = data[:name]
  @body = data[:body]
  #parse functions!
  parse_body(@body)
 end 
 def inspect
  "#{@type} #{@name} contains functions \n#{@functs.to_s}"
 end  
end


filename = ARGV[0]

text = String.new;
File.foreach(ARGV[0]) { |line| text << line }

# detects and outputs classes with their respective functions
text.scan(/(?<label>struct|class)\s+(?<classname>[a-zA-Z_:]+)\s*(?<match>{((\g<match>|[^{}]*))*});/m).each do |m|
 node = ClassNode.new({type: m[0], name: m[1], body: m[2]})
 puts node.inspect 
end
