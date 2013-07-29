From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 29 Jul 2013 21:20:33 +0000
Subject: Re: [patch] net_sched: stack info leak in cbq_dump_wrr()
Message-Id: <20130729212033.GB6386@minipsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130729193651.GA12525@elgon.mountain>
In-Reply-To: <20130729193651.GA12525@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Mon, Jul 29, 2013 at 09:36:51PM CEST, dan.carpenter@oracle.com wrote:
>opt.__reserved isn't cleared so we leak a byte of stack information.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/net/sched/sch_cbq.c b/net/sched/sch_cbq.c
>index 71a5688..6398a61 100644
>--- a/net/sched/sch_cbq.c
>+++ b/net/sched/sch_cbq.c
>@@ -1469,6 +1469,7 @@ static int cbq_dump_wrr(struct sk_buff *skb, struct cbq_class *cl)
> 	opt.allot = cl->allot;
> 	opt.priority = cl->priority + 1;
> 	opt.cpriority = cl->cpriority + 1;
>+	opt.__reserved = 0;

There's probably better to zero whole opt at the beginning of the function.
