From: Joe Perches <joe@perches.com>
Date: Mon, 29 Jul 2013 19:44:32 +0000
Subject: Re: [patch] net_sched: stack info leak in cbq_dump_wrr()
Message-Id: <1375127072.2075.48.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130729193651.GA12525@elgon.mountain>
In-Reply-To: <20130729193651.GA12525@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2013-07-29 at 22:36 +0300, Dan Carpenter wrote:
> opt.__reserved isn't cleared so we leak a byte of stack information.
[]
> diff --git a/net/sched/sch_cbq.c b/net/sched/sch_cbq.c
[]
> @@ -1469,6 +1469,7 @@ static int cbq_dump_wrr(struct sk_buff *skb, struct cbq_class *cl)
>  	opt.allot = cl->allot;
>  	opt.priority = cl->priority + 1;
>  	opt.cpriority = cl->cpriority + 1;
> +	opt.__reserved = 0;
>  	opt.weight = cl->weight;
>  	if (nla_put(skb, TCA_CBQ_WRROPT, sizeof(opt), &opt))
>  		goto nla_put_failure;

Alignment isn't guaranteed here so it'd
probably be better with a memset.


