From: Pavel Machek <pavel@suse.cz>
Date: Tue, 17 Jun 2008 12:51:04 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <20080617125103.GA4211@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com>
In-Reply-To: <20080610190540.GA25066@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi!

> What this tree is not:
> 	- it is not a place to dump code and then run away, hoping that
> 	  someone else will do the cleanup work for you.  While there
> 	  are developers available to do this kind of work, you need to
> 	  get someone to agree to "babysit" the code.

Hmm, how do I tap into that developer pool? :-)

Kohjinsha wifi driver is in state where it was ported to mac80211, and
it still works with minimum features, but it needs dead code removal
and rewriting the rest. That code is really very ugly.

I can do the handholding; I can probably do the rewrite, too (its
10000LoC), but it will take time...

							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
