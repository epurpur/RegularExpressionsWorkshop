library(tidyverse)
library(stringr)


#CAVEAT - I am not an R user! I did my best to translate my python into an R script. Please cut me some slack if you see some weird code in here

# Regular Expressions
# Regular Expressions are sort of like a mini language in and of themselves. Regular Expressions are a sequence of characters used to match patterns in text. Regular Expressions are 
# language agnostic and can be used in most (all?) programming languages including Python, R, Javascript, Java, etc. Regular Expressions can look very complicated and that is because 
# they are so versatile. You can match basically any pattern of text.



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

# Escape character
# we need to use the escape character (\, backslash) to literally interpret a period
# because the \ is an escape character in itself, we must escape it with another backslash
pattern = '\\.'
str_match_all(text_to_search, pattern)

# A practical example of the escape character is a URL
pattern = 'coreyms\\.com'
str_match_all(text_to_search, pattern)

# Matching Digits with \d
pattern = '\\d'
str_match_all(text_to_search, pattern)

# Matching word characters with \w
pattern = '\\w'
str_match_all(text_to_search, pattern)

# Anchors
# Anchors do not match characters specifically, but match invisible positions before or after characters. These are typically used in conjunction with other patterns
pattern = '\\bHa'
str_match_all(text_to_search, pattern)

# and the opposite. \B matches NOT a word boundary
pattern = '\\BHa'
str_match_all(text_to_search, pattern)

sentence = 'Start a sentence and then bring it to and end'
# ^ matches something at the beginning of a string
pattern = '^Start'
str_match_all(sentence, pattern)

# $ matches the end of a string
pattern = 'end$'
str_match_all(sentence, pattern)


## Practical Example - Matching Phone Numbers
# Let's do something a little more "real". First, see how to string these together and get a sequence of 3 numbers
pattern = '\\d\\d\\d'
str_match_all(text_to_search, pattern)

# and a full phone number
pattern = '\\d\\d\\d.\\d\\d\\d.\\d\\d\\d\\d'
str_match_all(text_to_search, pattern)




## Character Sets
# a character set uses [ ] to define specific characters. Even though a character set can have multiple characters in it, it is still only matching one character in the text
# in this example, the character set [-.] looks for just - and . characters
pattern = '\\d\\d\\d[-.]\\d\\d\\d[-.]\\d\\d\\d\\d'
str_match_all(text_to_search, pattern)

# only 800 or 900 phone numbers
pattern = '[89]00[-.]\\d\\d\\d[-.]\\d\\d\\d\\d'
str_match_all(text_to_search, pattern)

# Dash (-) in a character set.
# The dash character in a character set is a special character itself. At the beginning or end of a character set, it looks literally for a dash (-).
# Placed in between characters, it specifies a range of values
pattern = '[1-5]'
str_match_all(text_to_search, pattern)

pattern = '[a-e]'
str_match_all(text_to_search, pattern)

#upper or lower case characters a-e or A-E
pattern = '[a-eA-E]'
str_match_all(text_to_search, pattern)

# Carrot (^) in a character set. A Negative. Finds the opposite of your range of characters
pattern = '[^a-zA-Z]'
str_match_all(text_to_search, pattern)



## Quantifiers
# typing individual characters is error prone. We can use quantifiers to match a range of characters or specific number of characters
# use the { } to specify a quantifier
pattern = '\\d{3}.\\d{3}.\\d{4}'
str_match_all(text_to_search, pattern)


## Matching Names
# Sometimes we don't know the exact number of characters we are looking for. Let's use the names form our text_to_search as an example
# we will start with variations of Mr
pattern = 'Mr\\.'
str_match_all(text_to_search, pattern)

# sometimes 'mister' has a period after Mr, sometimes not. So we need an optional character
pattern = 'Mr\\.?'
str_match_all(text_to_search, pattern)

# now we will match the whole name for all of the misters
pattern = 'Mr\\.?\\s[A-Z]\\w*'
str_match_all(text_to_search, pattern)


## Groups
# Groups allow us to match several different patterns. Groups are created using ( )
# Now lets include all of the misses. The vertical pipe/bar character is an 'or' character
pattern = '(Mr|Ms|Mrs)\\.?\\s'
str_match_all(text_to_search, pattern)

pattern = '(Mr|Ms|Mrs)\\.?\\s[A-Z]\\w*'
str_match_all(text_to_search, pattern)


## Matching Emails
emails = c('
CoreyMSchafer@gmail.com,
corey.schafer@university.edu,
corey-321-schafer@my-work.net
')

# we will start my matching just the first address (CoreyMSchafer@gmail.com)
# before the @ it is just uppercase or lowercase letters
# after the @ it is any number of characters and .com
pattern = '[a-zA-Z]+@[a-zA-Z]+\\.com'
str_match_all(emails, pattern)

# now we can include other emails 
# the second email includes a '.' and ends with '.edu'
pattern = '[a-zA-Z0-9.-]+@[a-zA-Z-]+\\.(com|edu|net)'
str_match_all(emails, pattern)





