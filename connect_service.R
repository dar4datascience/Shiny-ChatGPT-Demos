# library(gptchatteR)
#
# chatter.auth(Sys.getenv('OPENAI_API_KEY'))
#
# chatter.create()
#
# #chatter.feed("I have a dataframe named df. It has two columns: A and B")
# cp <- chatter.plot(input = "Output r code to create a dataframe named df with two numeric columns: A and B. Use ggplot2 to plot a scatterplot where x axis is A, y is B.")
#
# cp$plot
#
# cp$command

library(chatgpt)

cat(ask_chatgpt("What do you think about R language?"))

cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
