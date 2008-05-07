From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 07 May 2008 22:38:00 +0000
Subject: Re: [PATCH] Remove cli()/sti() calls from HYSDN driver.
Message-Id: <20080507153800.16537fbc.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209673012-10500-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1209673012-10500-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, kkeil@suse.de, asselsm@gmail.com

On Thu,  1 May 2008 16:16:52 -0400
Mark Asselstine <mark.asselstine@windriver.com> wrote:

> >From looking at this driver the use of cli()/sti() within the do/while
> was a way to ensure interrupts were only disabled for short periods of
> time while the bulk of the time interrupts were free to occur. The
> use of the spin lock has eliminated the need to play with interrupts
> in this way while still allowing for IO to be protected.

OK.  If we still want the interrupt-latency optimisation then we should
switch over to using local_irq_disable().  But probably nobody cares.

> The remaining 3 sti() calls seem unneeded now that at no other point
> in the driver is there a call to cli().
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  drivers/isdn/hysdn/boardergo.c |   14 +++++---------

So... can we now do this?


--- a/drivers/isdn/hysdn/Kconfig~a
+++ a/drivers/isdn/hysdn/Kconfig
@@ -3,7 +3,7 @@
 #
 config HYSDN
 	tristate "Hypercope HYSDN cards (Champ, Ergo, Metro) support (module only)"
-	depends on m && PROC_FS && PCI && BROKEN_ON_SMP
+	depends on m && PROC_FS && PCI
 	help
 	  Say Y here if you have one of Hypercope's active PCI ISDN cards
 	  Champ, Ergo and Metro. You will then get a module called hysdn.
_

