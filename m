From: Francois Romieu <romieu@fr.zoreil.com>
Date: Tue, 24 Feb 2004 22:58:50 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check
Message-Id: <20040224235850.A24377@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy.Dunlap <rddunlap@osdl.org> :
[...]
> Hm, well, ok .... I've just reviewed 15 emails about ipv4/fib_hash.c,
> and (sadly ?) I've come to the conclusion that Walter's very first
> patch (at least first that I see now) is the best one I've seen for
> this.  However, I'm probably missing something, so tell me what/why...

If the second allocation (kmalloc) in the function fails, the first one
(slab) is not freed. Even if it's right, it is not completely kosher/easy to
check (it depends on the behavior of some code in a different function).
It can be done with a "slab_free_needed" variable but it is not exactly
pretty.

OTOH, if the conditional slab allocation is done after the kmalloc, one
can always free the previously/unconditionally kmalloced area. It is
self-contained and shows no dependancy on external code.

The virtues of gotos and single return point in a function are a different
story.

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
