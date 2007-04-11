From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Wed, 11 Apr 2007 11:44:13 +0000
Subject: Re: [KJ] [PATCH] HYSDN cards: use spin_lock_init() for spinlock
Message-Id: <20070411114413.GN24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411071951.GJ24898@traven>
In-Reply-To: <20070411071951.GJ24898@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

El Wed, Apr 11, 2007 at 03:23:07PM +0400 Alexey Dobriyan ha dit:

> On 4/11/07, Matthias Kaehlcke <matthias.kaehlcke@gmail.com> wrote:
> >HYSDN cards: use spin_lock_init() for spinlock initialization
> 
> >--- a/drivers/isdn/hysdn/hysdn_proclog.c
> >+++ b/drivers/isdn/hysdn/hysdn_proclog.c
> >@@ -299,7 +299,8 @@ hysdn_log_close(struct inode *ino, struct file *filep)
> > 	hysdn_card *card;
> > 	int retval = 0;
> > 	unsigned long flags;
> >-	spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
> >+	spinlock_t hysdn_lock;
> >+	spin_lock_init(&hysdn_lock);
> 
> Wow! Second spinlock on stack I've seen.

now that you say it, it really looks odd. the declaration doesn't make
sense and the calls to spin_lock_irqsave() and
spin_unlock_irqrestore() should probably receive card->hysdn_lock as
parameter instead of the spinlock on stack.

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

                If you don't know where you are going,
               you will probably end up somewhere else
                         (Laurence J. Peter)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
