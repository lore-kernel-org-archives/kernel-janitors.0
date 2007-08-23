From: "Scott Thompson" <postfail@hushmail.com>
Date: Thu, 23 Aug 2007 03:54:41 +0000
Subject: Ideas on column length in kernel "problem"?
Message-Id: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I haven't seen any recent solutions to this "problem"...

Many free (and not-free) mail clients wordwrap.  Hushmail wraps at 
68 (verified), Yahoo has options to wrap at a max of 99, and Gmail 
was somewhere around 85-90 as I recall.  Not sure on other free / 
inexpensive clients.  

However, several code modules have code lines with column lengths 
well over 80 (the worst I have seen was 211).  This prevents people 
with "minimal function" email clients (I'm being generous) from 
making changes in the area of these long code lines, or from even 
submitting fixes for the line length problem in modules themselves.

I don't have an easy solution short of finding volunteer(s) who can 
submit patches to resolve this or peer-pressuring module owners 
into resolving, so opening this issue up to the list for ideas 
here.  In the meantime I'll run a quick review to assess just how 
many changes this would be ...

Note -- I am well aware that us 'poor users' could just 'get a real 
email service', and if anyone knows of a free/inexpensive mail 
client that will be able to handle the wordwrap requirements for 
the current state of the linux tree please advise.

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------

