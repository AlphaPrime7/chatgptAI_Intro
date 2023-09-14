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
ask_chatgpt("2000 * 14000") #notice a mathematical string within chatGPT-the most brilliant part of the answer is 28000000
#embedded mathematical functions within LLMs-COOL!
sum('2+2') #notice how R cannot sum a string

#How can mathematics be achieved on language or strings. Example in R
string <- '1000000+3000000'
string_single_digits <- '2+4'


string_melt <- function(simple_string){
  simple_string <- gsub("[+]", ",",simple_string)
  simple_string <- strsplit(simple_string,',')
  return(simple_string)
}
string_melt(string)

string_melt_atomic <- function(simple_string){
  string_list <- c()
  if(simple_string != ""){
    for(i in 1:nchar(simple_string)){
      string_list <- c(string_list,substring(simple_string,i,i))
    }
    string_list
  }
}
string_melt_atomic(string)

#can pretty much make a function like this for every operator and find a way to switch between functions based on operator input
string_sum <- function(string){
  string_atoms <- string_melt_atomic(string)
  math_operator <- c('+')
  num_extract <- c()
  for(i in string_atoms){
    if(i %in% math_operator && i =='+'){
      next
      }
    }
  for(j in string_melt(string)){
    num_extract <- c(num_extract,as.numeric(j))
    }
  return(sum(num_extract))
}
string_sum(string)
string_sum(string_single_digits)
#hardcode example below
sum_string <- as.numeric(substring(string,1,1))+as.numeric(substring(string,3,3))
print(sum_string)
plus <- as.numeric(substring(string,2,2))
#What is impressive about a LLM doing math? Identifying numbers within text and mathematical operators within text.
#These models are trained to recognize * as multiply or + as addition or plus etc

#interactive chat session
chatgpt:::run_addin_ask_chatgpt()
