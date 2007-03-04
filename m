From: Sam Ravnborg <sam@ravnborg.org>
Date: Sun, 04 Mar 2007 21:30:21 +0000
Subject: Re: [KJ] What does (P) in /proc/modules mean?
Message-Id: <20070304213021.GA26464@uranus.ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
In-Reply-To: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 04, 2007 at 10:23:59AM -0800, Randy Dunlap wrote:
> On Sun, 4 Mar 2007 22:19:51 +1000 Badai Aqrandista wrote:
> 
> > Hi,
> > 
> > On 3/4/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > > I just tested this module on 2.6.20, no license issues/problems
> > > at all.  So what kernel version were you using and what other
> > > modules were loaded or had been loaded?
> > 
> > I think I found the cause. It's the Makefile. I copied the Makefile
> > from ldd3 and it includes this line:
> > 
> > CFLAGS += $(DEBFLAGS) -I$(LDDINCDIR)

ldd3 is wrong. Never ever mess around with CFLAGS. Use EXTRA_CFLAGS
which is there for a purpose.
Copied Greg + Jon to notice them.

> > When I removed -I$(LDDINCDIR) from that line and recompiled the
> > module, the (P) mark is gone and all printk's are printed to the log.
> > And $(LDDINCDIR) variable is empty because I didn't pass it.
> > 
> > So I think I can reduce the problem to: passing an empty -I parameter
> > to CFLAGS makes the module proprietory.
> 
> I'll confirm that.
> 
> > Why is that?
> 
> Good question.  I have no idea.
> Sam, do you have any idea why adding "-I " to a Makefile
> causes a module license not to be found correctly?
Puzzeled???
I did not try it out myself but I do not see why it should
impact module licensing.
It is only in a very few places this flag is set which makes it
look even more strange.

	Sam
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
