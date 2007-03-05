From: Greg KH <greg@kroah.com>
Date: Mon, 05 Mar 2007 03:49:25 +0000
Subject: Re: [KJ] What does (P) in /proc/modules mean?
Message-Id: <20070305034925.GA28478@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
In-Reply-To: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 04, 2007 at 10:30:21PM +0100, Sam Ravnborg wrote:
> On Sun, Mar 04, 2007 at 10:23:59AM -0800, Randy Dunlap wrote:
> > On Sun, 4 Mar 2007 22:19:51 +1000 Badai Aqrandista wrote:
> > 
> > > Hi,
> > > 
> > > On 3/4/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > > > I just tested this module on 2.6.20, no license issues/problems
> > > > at all.  So what kernel version were you using and what other
> > > > modules were loaded or had been loaded?
> > > 
> > > I think I found the cause. It's the Makefile. I copied the Makefile
> > > from ldd3 and it includes this line:
> > > 
> > > CFLAGS += $(DEBFLAGS) -I$(LDDINCDIR)
> 
> ldd3 is wrong. Never ever mess around with CFLAGS. Use EXTRA_CFLAGS
> which is there for a purpose.
> Copied Greg + Jon to notice them.

Thanks for letting us know, I think that for the few examples in LDD3
that use this, we didn't realize EXTRA_CFLAGS was possible (remember,
the book is quite old now...)

If we do a new release, this will be one of those things that we change.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
