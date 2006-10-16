From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 16 Oct 2006 04:44:12 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <1160973132.19143.402.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com>
	 <1160835602.5732.30.camel@localhost.localdomain>
In-Reply-To: <1160835602.5732.30.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: matthew@wil.cx, linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

On Sat, 2006-10-14 at 15:20 +0100, Alan Cox wrote:
> Ar Gwe, 2006-10-13 am 17:10 +0530, ysgrifennodd Amol Lad:
> > Removed save_flags()/cli()/sti() and used (light weight) spin locks
> > 
> 
> Three things I see that look problematic

> 2. If the irq handler itself dumbly locks to fix this then we get
> tty_flip_buffer_push() re-entering the other code paths and deadlocking
> if low latency is enabled

The comment above tty_flip_buffer_push() says "This function must not be
called from IRQ context if tty->low_latency is set". In this case
tty_flip_buffer_push() is called from IRQ context. Do you think
tty->low_latency can still be set for this case ? or I misunderstood
your statement completely...

> 3. Some of the use of local_save/spin_lock_irq seems over-clever and
> unneeded

Let me know, I'll fix them too.

> 
> Fixable but how about we just delete the file since it has been broken
> for ages and nobody can be using it ?
> 

If we cannot delete the file then we must fix it. It's not good the
drivers using old and deprecated interfaces in current phase of kernel
development.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
