require 'openai'

class OpenaiService
    def self.generate_recipe(ingredients)
      recipe_text = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY']).completions(
        engine: 'text-davinci-002',
        prompt: "I need a recipe for a dish only made with #{ingredients} ingredients: with step by step instructions",
      max_tokens: 1024
    ).choices[0].text
      return recipe_text
    end
  end  
  