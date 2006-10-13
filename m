From: Arjan van de Ven <arjan@infradead.org>
Date: Fri, 13 Oct 2006 11:56:12 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <1160740572.3000.489.camel@laptopd505.fenrus.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com>
In-Reply-To: <1160739628.19143.376.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

On Fri, 2006-10-13 at 17:10 +0530, Amol Lad wrote:
> Removed save_flags()/cli()/sti() and used (light weight) spin locks

Hi,

I applaud removing such legacy-should-be-dead-by-now functions; however,
I'm not entirely sure your conversion is correct. While you convert all
places that do cli/sti with locks.... you do not seem to be adding the
locks to the places that the cli/sti pairs protected against (the IRQ
handlers).... so it looks like your conversion is incomplete ;(

Greetings,
    Arjan van de Ven

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
