From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 15 Nov 2007 19:54:45 +0000
Subject: Re: [PATCH] alpha/parisc: Removing config variable DEBUG_RWLOCK
Message-Id: <alpine.LFD.0.9999.0711151453230.4568@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <473C065D.1000000@gmail.com>
	<20071115190605.GF20892@colo.lackof.org>
In-Reply-To: <20071115190605.GF20892@colo.lackof.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Grundler <grundler@parisc-linux.org>
Cc: kernel-janitors@vger.kernel.org, ink@jurassic.park.msu.ru, Andrew Morton <akpm@linux-foundation.org>, rth@twiddle.net, Jiri Olsa <olsajiri@gmail.com>, parisc-linux@parisc-linux.org

On Thu, 15 Nov 2007, Grant Grundler wrote:

> On Thu, Nov 15, 2007 at 09:42:05AM +0100, Jiri Olsa wrote:
> > Removing config variable DEBUG_RWLOCK, since it is not used

... snip ...

> > diff --git a/arch/parisc/configs/a500_defconfig b/arch/parisc/configs/a500_defconfig
> > index ea07121..ddacc72 100644
> > --- a/arch/parisc/configs/a500_defconfig
> > +++ b/arch/parisc/configs/a500_defconfig
> > @@ -1050,7 +1050,6 @@ CONFIG_SCHED_DEBUG=y
> >  CONFIG_FORCED_INLINING=y
> >  # CONFIG_RCU_TORTURE_TEST is not set
> >  # CONFIG_FAULT_INJECTION is not set
> > -# CONFIG_DEBUG_RWLOCK is not set
> >  # CONFIG_DEBUG_RODATA is not set

IIRC, you typically don't bother fixing up the defconfig files --
those will be regenerated eventually.

rday
--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
