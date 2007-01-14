From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 12:14:53 +0000
Subject: Re: [KJ] deprecated stuff and spin locks
Message-Id: <Pine.LNX.4.64.0701140711300.13191@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


whoops, i just answered *part* of my question:

On Sun, 14 Jan 2007, Robert P. J. Day wrote:

>   what do you do with static initializations like:
>
>   static struct irq_desc bad_irq_desc = {
>         .handle_irq = handle_bad_irq,
>         .lock = SPIN_LOCK_UNLOCKED
>   };
>
> or
>
>   static spinlock_t winbond_lock = SPIN_LOCK_UNLOCKED;
>
> if you're not supposed to use that macro anymore?  am i missing
> something obvious?

given the macro definitions in include/linux/spinlock_types.h:

#define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
#define DEFINE_RWLOCK(x)        rwlock_t x = __RW_LOCK_UNLOCKED(x)

it appears that you can address that *second* issue with one of:

DEFINE_SPINLOCK(foo);
static DEFINE_SPINLOCK(bar);

(i'm assuming that the macros __{RW|SPIN}_LOCK_UNLOCKED are still
valid and are not deprecated.)

  but i'm still not sure how to deal with that first issue cleanly.

rday

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
