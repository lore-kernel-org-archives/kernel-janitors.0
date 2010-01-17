From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sun, 17 Jan 2010 11:40:36 +0000
Subject: Re: [PATCH 1/9] drivers/char: Eliminate useless code
Message-Id: <4B52F734.6000408@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1001161656560.28745@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001161656560.28745@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dimitri Sivanich <sivanich@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>

Julia Lawall wrote:
> The variable x is initialized twice to the same (side effect-free)
> expression.  Drop one initialization.
[...]
> --- a/drivers/char/mmtimer.c
> +++ b/drivers/char/mmtimer.c
> @@ -546,9 +546,9 @@ static void mmtimer_tasklet(unsigned long data)
>  {
>  	int nodeid = data;
>  	struct mmtimer_node *mn = &timers[nodeid];
> -	struct mmtimer *x = rb_entry(mn->next, struct mmtimer, list);
> +	struct mmtimer *x;
>  	struct k_itimer *t;
>  	unsigned long flags;

The next x = rb_entry(mn->next, struct mmtimer, list); is preceded by a
test whether mn->next is NULL.

Unless that test is redundant too, your patch fixes a potential NULL
pointer dereference, introduced by commit cbacdd95 "SGI Altix mmtimer:
allow larger number of timers per node" in 2.6.26.
-- 
Stefan Richter
-===-=-=- ---= =---http://arcgraph.de/sr/
