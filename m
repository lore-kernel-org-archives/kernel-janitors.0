From: Greg KH <greg@kroah.com>
Date: Wed, 02 Jul 2008 23:11:18 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <20080702231118.GB20129@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <20080617125103.GA4211@ucw.cz>
In-Reply-To: <20080617125103.GA4211@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@suse.cz>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Jun 17, 2008 at 02:51:04PM +0200, Pavel Machek wrote:
> Hi!
> 
> > What this tree is not:
> > 	- it is not a place to dump code and then run away, hoping that
> > 	  someone else will do the cleanup work for you.  While there
> > 	  are developers available to do this kind of work, you need to
> > 	  get someone to agree to "babysit" the code.
> 
> Hmm, how do I tap into that developer pool? :-)
> 
> Kohjinsha wifi driver is in state where it was ported to mac80211, and
> it still works with minimum features, but it needs dead code removal
> and rewriting the rest. That code is really very ugly.
> 
> I can do the handholding; I can probably do the rewrite, too (its
> 10000LoC), but it will take time...

If the patch at least builds, send it to me for inclusion in -staging if
you want to get some exposure for it.

thanks,

greg k-h
