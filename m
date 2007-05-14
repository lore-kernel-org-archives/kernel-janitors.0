From: Francois Romieu <romieu@fr.zoreil.com>
Date: Mon, 14 May 2007 21:13:00 +0000
Subject: Re: [KJ] what's the current story on cli()/sti()/save_flags() ...?
Message-Id: <20070514211300.GA28382@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day <rpjday@mindspring.com> :
[...]
> but there's still a fair bit of that stuff in the kernel source tree.
> the file Documentation/spinlocks.txt also talks about replacing:
> 
>         unsigned long flags;
> 
>         save_flags(flags); cli();
>          ... critical section ...
>         restore_flags(flags);
> 
> with something like:
> 
>    spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;

It should probably use spin_lock_init() instead.

[...]
> so, theoretically, what's the goal WRT to those allegedly deprecated
> routines?  are they supposed to be gone by now or what?

They ought to be gone in driver (non-platform) code. Consider serial
drivers a bit special and check the archives of the l-k if you want to
hack them.

-- 
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
