From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 16:39:09 +0000
Subject: Re: [KJ] using "mutexes" in place of semaphores
Message-Id: <Pine.LNX.4.64.0702171135590.24871@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 17 Feb 2007, Arnd Bergmann wrote:

> Basically, every instance of init_MUTEX() can (and should) be
> converted to using mutex_init() on a struct mutex. Those few places
> that call sema_init with a count of one are probably just a subset
> of these. Similarly, most of the occurences of sema_init(sem, 0)
> seem to be the kind that should be converted to 'struct completion'.

waitaminnit.  you're not claiming that a currently-locked semaphore is
exactly equivalent to a completion, are you?

as i read it, calling "complete()" on a completion will wake *all*
processes waiting for that completion, no?  not just one, as a
semaphore would.

so i'm assuming what you're saying is that, in many places where you
see a "sema_init(sem, 0)", it would be *appropriate* to have used a
completion instead, is that what you meant?  thanks.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
