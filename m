From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 10 Apr 2007 21:50:54 +0000
Subject: Re: [KJ] [PATCH] include KERN_* constant in printk() calls in
Message-Id: <Pine.LNX.4.64.0704101748570.24794@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070409194151.GG4262@traven>
In-Reply-To: <20070409194151.GG4262@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 10 Apr 2007, Dave Jones wrote:

> On Wed, Apr 11, 2007 at 01:07:06AM +0400, Alexey Dobriyan wrote:
>  > On Mon, Apr 09, 2007 at 04:02:09PM -0400, Dave Jones wrote:
>  > > On Mon, Apr 09, 2007 at 09:41:51PM +0200, Matthias Kaehlcke wrote:
>  > >  > -		printk(" %02x", (unsigned char)data[offset + i]);
>  > >  > +		printk(KERN_ERR " %02x", (unsigned char)data[offset + i]);
>  > >  >  	}
>  > >
>  > > This one is wrong.  It's printing a bunch of numbers in a loop, so with your change
>  > > it'll print for example...
>  > >
>  > > KERN_ERR 00 KERN_ERR 01 KERN_ERR 02 KERN_ERR etc etc..
>  > >
>  > > you only want the KERN_ERR at the beginning of each line.
>  >
>  > Am I the only one who wants config option to nop all these KERN_* stuff ?
>
> probably ;)
> Trivial to do though, but I doubt it'll save more than a page or so on
> most configurations, and for those that really care about being tight
> on space (embedded for eg), they've usually disabled huge swathes of kernel
> code, so the number of printk's is reduced, reducing the space savings
> from this idea also..

or they've simply disabled PRINTK in its entirety.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
