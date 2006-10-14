From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sat, 14 Oct 2006 14:20:02 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <1160835602.5732.30.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com>
In-Reply-To: <1160739628.19143.376.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Ar Gwe, 2006-10-13 am 17:10 +0530, ysgrifennodd Amol Lad:
> Removed save_flags()/cli()/sti() and used (light weight) spin locks
> 

Three things I see that look problematic

1. The irq locking isn't doing anything as the IRQ handler itself is not
taking the lock
2. If the irq handler itself dumbly locks to fix this then we get
tty_flip_buffer_push() re-entering the other code paths and deadlocking
if low latency is enabled
3. Some of the use of local_save/spin_lock_irq seems over-clever and
unneeded

Fixable but how about we just delete the file since it has been broken
for ages and nobody can be using it ?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
