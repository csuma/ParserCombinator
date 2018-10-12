
require 'rspec'
require 'lexer'

describe Lexer do
	it "can initialize" do
		lexer = Lexer.new
		
		expect(lexer.text).to eq('')
		expect(lexer.symbol).to eq('')
		expect(lexer.token).to be_nil
		expect(lexer.column).to eq(0)
		expect(lexer.line).to eq(0)
	end

	it "can set text" do
		lexer = Lexer.new
		lexer.text = "Text"
		
		expect(lexer.text).to eq("Text")
		expect(lexer.symbol).to eq('')
		expect(lexer.token).to be_nil
		expect(lexer.column).to eq(0)
		expect(lexer.line).to eq(0)
		
	end
	
	it "can add patterns and symbols" do
		lexer = Lexer.new
		lexer.add_regex(/test/, :test)
		lexer.add_regex(/dummy/, :dummy)
				
		
	end
	
	it "can read numbers" do
		lexer = Lexer.new
		lexer.text = "42"
		
		expect(lexer.can_read?).to be true
		
		lexer.read!
		
		expect(lexer.symbol).to eq(:number)
		expect(lexer.token).to eq(42)
		expect(lexer.column).to eq(1)
		expect(lexer.line).to eq(1)
	end
end

