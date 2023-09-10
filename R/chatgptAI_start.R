#Some inspiration

#CodeLingo App: https://analytica.shinyapps.io/codelingo/
#Optimized httr usage: https://www.r-bloggers.com/2023/03/call-chatgpt-or-really-any-other-api-from-r/


#First look at ChatGPT
library(chatgpt)

#function to access the chatgpt platform to create a key
chatgpt_get_key <- function(url="https://platform.openai.com/"){
  library(devtools)
  browseURL(url)
}
chatgpt_get_key()

#Saving the openAI key
edit_r_environ()

#set the api key
Sys.setenv(OPENAI_API_KEY = Sys.getenv('OPENAI_API_KEY'))

#My first chatgpt Q
ask_chatgpt("who is barack obama")
ask_chatgpt("2000 * 14000") #notice a mathematical string within chatGPT-the most brillian part of the anwer is 28000000
sum('2+2') #notice how R cannot sum a string

#interactive chat session
chatgpt:::run_addin_ask_chatgpt()
