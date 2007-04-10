From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 10 Apr 2007 21:58:26 +0000
Subject: Re: [KJ] [PATCH] include KERN_* constant in printk() calls in
Message-Id: <20070410150206.9ba907b1.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070409194151.GG4262@traven>
In-Reply-To: <20070409194151.GG4262@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 11 Apr 2007 01:07:06 +0400 Alexey Dobriyan wrote:

> On Mon, Apr 09, 2007 at 04:02:09PM -0400, Dave Jones wrote:
> > On Mon, Apr 09, 2007 at 09:41:51PM +0200, Matthias Kaehlcke wrote:
> >  > -		printk(" %02x", (unsigned char)data[offset + i]);
> >  > +		printk(KERN_ERR " %02x", (unsigned char)data[offset + i]);
> >  >  	}
> >
> > This one is wrong.  It's printing a bunch of numbers in a loop, so with your change
> > it'll print for example...
> >
> > KERN_ERR 00 KERN_ERR 01 KERN_ERR 02 KERN_ERR etc etc..
> >
> > you only want the KERN_ERR at the beginning of each line.
> 
> Am I the only one who wants config option to nop all these KERN_* stuff ?
> (with only possible exception probably being KERN_DEBUG)

For what purpose?
I use boot option "ignore_loglevel" to ignore that KERN_* stuff.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
