# autogen_page
generate a quick html formatted from a bibtex file

I maintain a Tumblr page which posts, among other things, lists of recent publications
by researchers in my institution.  Doing this manually is not efficient, so I tried
to solve the problem through scripting.

This script takes a bibliography in BibTeX format, parses the appropriate fields, 
and generates a custom block of HTML which can then be pasted into the Tumblr
new post window.

It is not perfect; partly because the BibTeX export is not necessarily consistent
from publication to publication.  A fair amount of work would be necessary to cover 
all the edge cases where a comma is missing, or someone's name is formatted differently
(first initial + last name vs. first name + last name), etc.  I decided that I would
not sweat the details since the most important aspect of each post is the DOI link to 
the actual journal articles, and those generally get produced without issues.

Future development avenues include:  
- fixing those edge cases and making the formatting more accurate (from a librarian's 
point of view); 
- making it so the script creates the Tumblr post automatically (via packages such as 
WebService::Tumblr or others);
- figuring out if there's a way to automate the finding/pulling of references (currently
done by manually importing recent references from databases such as Web of Science or
SciFinder into a reference manager such as Mendeley).
