From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 09 Jun 2007 06:23:16 +0000
Subject: Re: [KJ] [PATCH 2/4] 2.6 drivers/net lp46e replace SIZE macros
Message-Id: <Pine.LNX.4.64.0706090221120.5987@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070609031353.14624.16332.sendpatchset@localhost.localdomain>
In-Reply-To: <20070609031353.14624.16332.sendpatchset@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 9 Jun 2007, acripps wrote:

> Replaced SIZE(x) macro with the more descriptive ARRAY_SIZE(arr) macro
> defined in kernel.h
> Also removed 22 lines of code that will never be compiled because of
> preprocessor directive: #if 0
> compile tested, no compile time issues found.
> Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>
>
>
> diff -Nuar linux-2.6/drivers/net/lp486e.c linux-2.6-patched/drivers/net/lp486e.c
> --- linux-2.6/drivers/net/lp486e.c	2007-05-22 20:31:03.000000000 -0230
> +++ linux-2.6-patched/drivers/net/lp486e.c	2007-05-25 22:43:16.000000000 -0230
> @@ -515,33 +515,6 @@
>  	outb(0, IOADDR+8);
>  }
>
> -#define SIZE(x)	(sizeof(x)/sizeof((x)[0]))
> -
> -#if 0
> -/* selftest or dump */
> -static void
> -i596_port_do(struct net_device *dev, int portcmd, char *cmdname) {
> -	struct i596_private *lp = dev->priv;
> -	u16 *outp;
> -	int i, m;
> -
> -	memset((void *)&(lp->dump), 0, sizeof(struct i596_dump));
> -	outp = &(lp->dump.dump[0]);
> -
> -	PORT(va_to_pa(outp), portcmd);
> -	mdelay(30);             /* random, unmotivated */
> -
> -	printk("lp486e i82596 %s result:\n", cmdname);
> -	for (m = SIZE(lp->dump.dump); m && lp->dump.dump[m-1] = 0; m--)
> -		;
> -	for (i = 0; i < m; i++) {
> -		printk(" %04x", lp->dump.dump[i]);
> -		if (i%8 = 7)
> -			printk("\n");
> -	}
> -	printk("\n");
> -}
> -#endif
>
>  static int
>  i596_scp_setup(struct net_device *dev) {

a couple points:

1) just because something is surrounded by "#if 0" doesn't mean it can
simply be deleted.  there's all kinds of emotional baggage associated
with some of these snippets, and some developers aren't ready to let
these things go just yet.

2) the patch above has nothing to do with "ARRAY_SIZE", so your patch
description is inappropriate.  you're simply deleting the SIZE()
macro, nothing more.

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
