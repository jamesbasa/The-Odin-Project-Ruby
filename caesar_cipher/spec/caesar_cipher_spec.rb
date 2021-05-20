require './caesar_cipher.rb'

describe CaesarCipher do
    before(:all) do 
        @caesar_cipher = CaesarCipher.new
    end

    context "When testing the CaesarCipher class" do 

        it "should work with small positive shift when we call the encrypt method" do 
            input = "What a string!"
            output = @caesar_cipher.encrypt(input, 5)
            expect(output).to eq "Bmfy f xywnsl!"
        end

        it "should work with large positive shift when we call the encrypt method" do 
            input = "Caesar Cipher"
            output = @caesar_cipher.encrypt(input, 24)
            expect(output).to eq "Aycqyp Agnfcp"
        end

        it "should work with negative shift and magnitude over 25 when we call the encrypt method" do 
            input = "abC `!@#$/}"
            output = @caesar_cipher.encrypt(input, -30)
            input2 = "abC `!@#$/}"
            output2 = @caesar_cipher.encrypt(input2, -4)
            expect(output).to eq output2
        end

    end
end
