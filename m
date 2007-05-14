From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 14 May 2007 21:09:57 +0000
Subject: Re: [KJ] what's the current story on cli()/sti()/save_flags() ...?
Message-Id: <9a8748490705141409o39391d13s52975addc394e75c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 14/05/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   i'm trying to get straight in my mind what the current situation is
> regarding the deprecation/removal status of all of:
>
>   * cli()
>   * sti()
>   * save_flags()
>   * save_flags_cli()
>   * restore_flags()
>
>   according to Documentation/cli-sti-removal.txt, all of those should
> have been gone long ago:
>
> "... to make the transition easier, we've still kept the cli(), sti(),
> save_flags(), save_flags_cli() and restore_flags() macros defined
> on UP systems - but their usage will be phased out until 2.6 is
> released."
>
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
>
>
>         unsigned long flags;
>
>         spin_lock_irqsave(&xxx_lock, flags);
>         ... critical section here ..
>         spin_unlock_irqrestore(&xxx_lock, flags);
>
> so, theoretically, what's the goal WRT to those allegedly deprecated
> routines?  are they supposed to be gone by now or what?
>
> rday

As I understand it, anything that uses cli() and sti() today is broken
on SMP (and probably broken on UP+preempt as well). So they should be
converted to proper locking - but most of the low hanging fruit is
probably gone by now or in old and unused drivers, so what's left is
probably either difficult to fix up or in code that noone can be
bothered to fix.

The day when we can remove cli()/sti() is probably not close, but
hopefully we'll get there eventually.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
