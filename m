From: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 20 Aug 2013 16:50:07 +0000
Subject: Re: Strange Makefile rule
Message-Id: <52139E3F.9090400@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDoAAc3QmK20RscRpi7_U=cU+0BD9RscH6YYYdzjYp1FLg@mail.gmail.com>
In-Reply-To: <CA+MoWDoAAc3QmK20RscRpi7_U=cU+0BD9RscH6YYYdzjYp1FLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/20/13 09:42, Peter Senna Tschudin wrote:
> I do not have cross compile environment but I'm curious how the
> Makefile rule works:
> 
> linux-next]$ cat drivers/net/ethernet/arc/Makefile
> 
> obj-$(CONFIG_ARC_EMAC) += arc_emac.o
> 
> There is no file named arc_emac.h and arc_emac.c at
> drivers/net/ethernet/arc, so what does that line do?

It uses the rule from the previous line in the Makefile.
Both lines are:

arc_emac-objs := emac_main.o emac_mdio.o
obj-$(CONFIG_ARC_EMAC) += arc_emac.o


Any xyz-objs defines the files to be used to build xyz.o.

Is that clear yet?


-- 
~Randy
