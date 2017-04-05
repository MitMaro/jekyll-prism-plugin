require 'spec_helper'

RSpec.describe Jekyll::Prism do

	let(:doc) { doc_with_content(content) }
	let(:content)  { '{% prism javascript %} My Code {% endprism %}' }
	let(:output) do
		doc.content = content
		doc.output  = Jekyll::Renderer.new(doc.site, doc).run
	end
	context "valid parameters" do
		it "Understands how to get a language parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@language)).to eql("javascript")
			prism = Jekyll::Prism.new("prism", 'javascript numbering ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@language)).to eql("javascript")
		end
	
		it "Understands how to accept a file parameter" do
			prism = Jekyll::Prism.new("prism", 'file="path/to/file.js" ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@file)).to eql("path/to/file.js")
			prism = Jekyll::Prism.new("prism", 'javascript file="path/to/file.js" ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@file)).to eql("path/to/file.js")
			prism = Jekyll::Prism.new("prism", 'javascript file="path/to/file.js" highlight=10', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@file)).to eql("path/to/file.js")
		end
	
		it "Understands how to accept a highlight parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript highlight="1-2,4,5-9" ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@highlight)).to eql("1-2,4,5-9")
		end

		it "Understands how to accept a user parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript user="john"', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@user)).to eql("john")
		end

		it "Understands how to accept a host parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript host="local" ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@host)).to eql("local")
		end
	
		it "Understands how to accept a prompt parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript prompt="john" ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@prompt)).to eql("john")
		end

		it "Understands how to accept a output parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript output="1-2,4,5-9"', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@output)).to eql("1-2,4,5-9")
		end

		it "Understands how to accept a numbering parameter" do
			prism = Jekyll::Prism.new("prism", 'javascript numbering ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@numbering)).to eql(true)
			prism = Jekyll::Prism.new("prism", 'javascript numbering=10 ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@numbering)).to eql(10)
			prism = Jekyll::Prism.new("prism", 'javascript numbering=-10 ', ["{% endprism %}"]);
			expect(prism.instance_variable_get(:@numbering)).to eql(-10)
		end

	end
	
	context "Valid render from code with all options" do
		
		let(:content)  { '{% prism cpp numbering=5 highlight="1,2-5,10" %} My Code {% endprism %}' }
		
		it "Understands how to render code from code block" do
			expect(output).to match("<pre class=\" language-cpp  line-numbers \" data-start=\"5\" data-line=\"1,2-5,10\"><code>My Code</code></pre>")
		end
	end

	context "Valid render from code with user, host, and output options on" do
		
		let(:content)  { '{% prism cpp host="local" user="john" output="1,2-5,10" %} My Code {% endprism %}' }
		
		it "Understands how to render code from code block" do
			expect(output).to match("<pre class=\" language-java  command-line \" data-output=\"1,2-5,10\" data-user=\"john\" data-host=\"local\"></pre>")
		end
	end

	context "Valid render from code with prompt and output options on" do
		
		let(:content)  { '{% prism cpp prompt="john" output="1,2-5,10" %} My Code {% endprism %}' }
		
		it "Understands how to render code from code block" do
			expect(output).to match("<pre class=\" language-java  command-line \" data-output=\"2-4\" data-prompt=\"john\"></pre>")
		end
	end
	
	context "Valid render from file with all options" do
		
		let(:content)  { '{% prism cpp file="path/to/file.cpp" numbering=5 highlight="1,2-5,10" %}{% endprism %}' }
		
		it "Understands how to render code from code block" do
			expect(output).to match("<pre class=\" language-cpp  line-numbers \" data-start=\"5\" data-line=\"1,2-5,10\" data-src=\"path/to/file.cpp\"></pre>")
		end
	end
	
	context "Valid render from file with all options without language" do
		
		let(:content)  { '{% prism file="path/to/file.cpp" numbering=5 highlight="1,2-5,10" %}{% endprism %}' }
		
		it "Understands how to render code from code block" do
			expect(output).to match("<pre class=\" line-numbers \" data-start=\"5\" data-line=\"1,2-5,10\" data-src=\"path/to/file.cpp\"></pre>")
		end
	end
end
