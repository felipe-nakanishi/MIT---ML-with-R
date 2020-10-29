## Identifying Spam

Nearly every email user has at some point encountered a "spam" email, which is 
an unsolicited message often advertising a product, containing links to malware,
or attempting to scam the recipient. Roughly 80-90% of more than 100 billion 
emails sent each day are spam emails, most being sent from botnets of 
malware-infected computers. The remainder of emails are called "ham" emails.

As a result of the huge number of spam emails being sent across the Internet 
each day, most email providers offer a spam filter that automatically flags 
likely spam messages and separates them from the ham. Though these filters use 
a number of techniques (e.g. looking up the sender in a so-called 
"Blackhole List" that contains IP addresses of likely spammers), most rely 
heavily on the analysis of the contents of an email via text analytics.

In this homework problem, we will build and evaluate a spam filter using a 
publicly available dataset first described in the 2006 conference paper "Spam 
Filtering with Naive Bayes -- Which Naive Bayes?" by V. Metsis, I. 
Androutsopoulos, and G. Paliouras. The "ham" messages in this dataset come from 
the inbox of former Enron Managing Director for Research Vincent Kaminski, one 
of the inboxes in the Enron Corpus. One source of spam messages in this dataset 
is the SpamAssassin corpus, which contains hand-labeled spam messages 
contributed by Internet users. The remaining spam was collected by Project Honey
Pot, a project that collects spam messages and identifies spammers by publishing
email address that humans would know not to contact but that bots might target 
with spam. The full dataset we will use was constructed as roughly a 75/25 mix 
of the ham and spam messages.

The dataset contains just two fields:

text: The text of the email.
spam: A binary variable indicating if the email was spam.
 

IMPORTANT NOTE: This problem (Separating Spam from Ham) continues on the next 
page with additional exercises. The second page is optional, but if you want to 
try it out, remember to save your work so you can start the next page where you 
left off here.

