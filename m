From: Joe Perches <joe@perches.com>
Date: Mon, 29 Jul 2013 21:50:42 +0000
Subject: Re: [patch] net_sched: stack info leak in cbq_dump_wrr()
Message-Id: <1375134642.2075.77.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375127072.2075.48.camel@joe-AO722>
	 <20130729200114.GA29160@mwanda> <1375128751.2075.58.camel@joe-AO722>
	 <20130729.141725.1188109086272236102.davem@davemloft.net>
In-Reply-To: <20130729.141725.1188109086272236102.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: dan.carpenter@oracle.com, jhs@mojatatu.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2013-07-29 at 14:17 -0700, David Miller wrote:
> From: Joe Perches <joe@perches.com>
> Date: Mon, 29 Jul 2013 13:12:31 -0700
> 
> > On Mon, 2013-07-29 at 23:01 +0300, Dan Carpenter wrote:
> >> On Mon, Jul 29, 2013 at 12:44:32PM -0700, Joe Perches wrote:
> >> > On Mon, 2013-07-29 at 22:36 +0300, Dan Carpenter wrote:
> >> > > opt.__reserved isn't cleared so we leak a byte of stack information.
> >> > []
> >> > > diff --git a/net/sched/sch_cbq.c b/net/sched/sch_cbq.c
> >> > []
> >> > > @@ -1469,6 +1469,7 @@ static int cbq_dump_wrr(struct sk_buff *skb, struct cbq_class *cl)
> >> > >          opt.allot = cl->allot;
> >> > >          opt.priority = cl->priority + 1;
> >> > >          opt.cpriority = cl->cpriority + 1;
> >> > > +        opt.__reserved = 0;
> >> > >          opt.weight = cl->weight;
> >> > >          if (nla_put(skb, TCA_CBQ_WRROPT, sizeof(opt), &opt))
> >> > >                  goto nla_put_failure;
> >> > 
> >> > Alignment isn't guaranteed here so it'd
> >> > probably be better with a memset.
> >> > 
> >> 
> >> Hm...  Which arches would align it differently?
> > 
> > Hey Dan.
> > 
> > None so far as I know, but what difference does it make
> > when it's a general correctness issue?
> 
> Should see if the compiler optimizes the spurious stores away,
> and if not we can use an initializer.

If the initializer is

	struct foo = {0};

then as far as I know, the compiler is free to 
not initialize any padding.

However, it looks like gcc 4.7 generates the same
code for this with or without the __aligned__ use.

(with gcc -O2 -S t.c)

$ cat t.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct foo {
	int a;
	char b __attribute__((__aligned__(256)));
	long c;
};

void init1(void)
{
	struct foo bar = {0};
	printf("%p\n", &bar);
}

void init2(void)
{
	struct foo bar;
	memset(&bar, 0, sizeof(bar));
	printf("%p\n", &bar);
}


