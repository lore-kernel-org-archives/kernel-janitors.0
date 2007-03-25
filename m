From: Mike Isely <isely@isely.net>
Date: Sun, 25 Mar 2007 23:28:11 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <Pine.LNX.4.64.0703251819390.15083@cnc.isely.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 26 Mar 2007, Bernd Petrovitsch wrote:

> On Sun, 2007-03-25 at 17:16 -0500, Mike Isely wrote:
> > The setting I know is called indent-tabs-mode, not c-indent-tabs-mode.  
> 
> It seems to me that they aer somwhat similar, If I read
> http://www.emacswiki.org/cgi-bin/wiki/IndentingC.

I had no idea about that wiki.  Very nice.  Thanks for pointing it out.  

However I don't understand that comment.  There is no reference to 
c-indent-tabs-mode anywhere on that page except in use in a single 
example - and I think that's a typo in the example.  And 
c-indent-tabs-mode is unrecognized by my GNU emacs version 21 
installation.


> 
> > It's also not better or worse than c-basic-offset; it's complementary.  
> > The following all work together:
> [ ... concise description deleted ...]
> > illustrate the relationship among those settings.  So just "eliminating" 
> > c-basic-offset and replacing it with indent-tabs-mode doesn't accomplish 
> > what one might expect.
> 
> Sorry, I never meant replacing but adding it to enforce the CodingStyle.
> And adding "tab-width: 8" is also not wrong (and *if* there is a correct
> default value for tab-width:, it is IMHO 8).

Then there is agreement here that the original proposed patch is not a 
good idea.


> 
> > I think it's good form to have all those settings in a source file (with 
> > c-basic-offset set to 8 not four like the example above).  It's not 
> 
> /me too.
> 
> > redundant with the documented style.  It causes anyone who loads the 
> > file with emacs to automatically adopt the indentation conventions 
> > intended for that source file and that has to be a good thing.
> > 
> > I for one work in environments other than v4l-dvb, and those other 
> > environments don't always have the same coding style.  To me it makes 
> > perfect sense that the coding style can be encoded into the source file 
> > itself.  Then I don't have to worry about manually reconfiguring my 
> 
> Yup. Actually vi/vim supports similar annotations.

I'm not a vi/vim expert, but I've had one coworker who was.  Every time 
I committed a change with those emacs declarations added, he always 
followed up with another commit to add the vi/vim equivalents :-)

  -Mike


-- 
                        |         Mike Isely          |     PGP fingerprint
     Spammers Die!!     |                             | 03 54 43 4D 75 E5 CC 92
                        |   isely @ pobox (dot) com   | 71 16 01 E2 B5 F5 C1 E8
                        |                             |
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
