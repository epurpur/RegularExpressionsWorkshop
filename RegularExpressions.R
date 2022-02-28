library(tidyverse)
library(stringr)


#CAVEAT - I am not an R user! I did my best to translate my python into an R script. Please cut me some slack if you see some weird code in here

####FOR ME . REMEMBER str_match and str_match_all

text_to_search = c('
abcdefghijklmnopqurtuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890

Ha HaHa

MetaCharacters (Need to be escaped):
. ^ $ * + ? { } [ ] \ | ( )

coreyms.com

321-555-4321
123.555.1234
123*555*1234
800-555-1234
900-555-1234

Mr. Schafer
Mr Smith
Ms Davis
Mrs. Robinson
Mr. T
')

pattern = 'abc'
str_match(text_to_search, pattern)

# META CHARACTERS
# Meta characters in regular expressions are characters that, if not interpreted literally, find other characters or patters
# These include ., /, ?, $, etc...
pattern = '.'
str_match_all(text_to_search, pattern)
