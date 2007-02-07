From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 07 Feb 2007 17:00:09 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <20070207090009.6f74398b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 7 Feb 2007 09:56:53 -0500 (EST) Rich Morgan wrote:

> 
> On Wed, February 7, 2007 9:22 am, Robert P. J. Day wrote:
> > given that we're in a 2-week window *now*, i'm guessing things are
> > going be some kind of busy so patches that aren't considered
> > breathlessly critical might be overlooked.  and the window closes
> > again, and the KJ person is now looking at 2.6.21.  possibly.
> 
> Could a group of patchers get together and submit, say, one larger patch
> instead of 10 smaller patches and have a better opportunity of getting
> them included in rc1?  Do the subsystem maintainers decide what patches
> are forwarded onto Linus?

I agree with Robert that this doesn't help out.

Yes, the subsystem maintainers decide that.  And the 2-week open merge
window is more flexible that it is "hard," so some non-critical patches
will almost definitely be merged after that window.

Still, patches need to have been merged somewhere (preferably -mm)
for testing for some duration before they are candidates to be merged
into mainline.  [This sorta makes the old KJ patchset not very
meaningful any longer.  Note that several of Ahmed Darwish's
ARRAY_SIZE patches have already been acked and/or merged by their
subsystem maintainers.]


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
