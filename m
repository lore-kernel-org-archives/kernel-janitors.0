From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 08 Nov 2007 06:55:09 +0000
Subject: Re: [PATCH] use "is_power_of_2()" macro for simplicity.
Message-Id: <Pine.LNX.4.64.0711080151200.5666@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711070301540.8914@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0711070301540.8914@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 7 Nov 2007, Matthew Wilcox wrote:

> On Wed, Nov 07, 2007 at 03:03:39AM -0500, Robert P. J. Day wrote:
> >  	 */
> > -	if (size & (size - 1)) {
> > +	if (!is_power_of_2(size)) {
> >  		BUG_ON(size > 0x80000000);
> >  		size = roundup_pow_of_two(size);
> >  	}
>
> Why not just delete the if?
>
> 	BUG_ON(size > 0x80000000);
> 	size = roundup_pow_of_two(size);
>
> It's not a fast-path, and we'll consume a little less .text

sure, that's doable.  i'm only reluctant to make simplifications like
that since sometimes it's visually useful to have a test there, to
perhaps make it clear that something should *normally* be a power of
two, but you want to handle the case when, occasionally, it isn't.

by taking out the test, someone reading the code might get the
impression that that value will *always* be rounded up (that is,
actually changed).  like i said, it's more a visual thing than
anything else but, if no one cares, i'll take out the test.  as you
noticed, it's entirely equivalent.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
