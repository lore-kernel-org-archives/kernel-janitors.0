From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 10 Apr 2007 21:45:07 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site> <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
 <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
 <Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr> <ada7isjq52p.fsf@cisco.com>
In-Reply-To: <ada7isjq52p.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Milind Arun Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

On Tue, 10 Apr 2007, Roland Dreier wrote:

>  > >but that's where you would use the more explicit
>  > >__RAW_SPIN_LOCK_UNLOCKED, no?  AFAIK, you really can remove the macro
>  > >SPIN_LOCK_UNLOCKED in its entirety.
>  >
>  > I don't remember LDD speaking about __RAW_*. (And other than not
>  > having looked into the code to date, I don't know the difference.)
>
> Don't worry about the __RAW_SPIN_LOCK_UNLOCKED stuff, that's
> obviously not for generic code to use.  The right answer (as I said
> before) is to use DEFINE_SPINLOCK().

that works fine if you're defining a single spinlock, but what do you
do in cases like this:

arch/sparc/lib/atomic32.c:      [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED

that is, when you're assigning an array of them?  you still need some
kind of generic, unnamed spinlock in those circumstances, no?

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
