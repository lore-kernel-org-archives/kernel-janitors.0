From: David Miller <davem@davemloft.net>
Date: Thu, 15 Dec 2011 17:01:08 +0000
Subject: Re: [patch -next] tcp_memcontrol: fix reversed if condition
Message-Id: <20111215.120108.663752764643957547.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215110510.GA2674@elgon.mountain>
In-Reply-To: <20111215110510.GA2674@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: glommer@parallels.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 14:05:10 +0300

> We should only dereference the pointer if it's valid, not the other way
> round.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

It's nice to see how thoroughly this code has been tested, sigh...

Applied, thanks a lot Dan.

> diff --git a/net/ipv4/tcp_memcontrol.c b/net/ipv4/tcp_memcontrol.c
> index 171d7b6..7fed04f 100644
> --- a/net/ipv4/tcp_memcontrol.c
> +++ b/net/ipv4/tcp_memcontrol.c
> @@ -44,7 +44,7 @@ static inline struct tcp_memcontrol *tcp_from_cgproto(struct cg_proto *cg_proto)
>  
>  static void memcg_tcp_enter_memory_pressure(struct sock *sk)
>  {
> -	if (!sk->sk_cgrp->memory_pressure)
> +	if (sk->sk_cgrp->memory_pressure)
>  		*sk->sk_cgrp->memory_pressure = 1;
>  }
>  EXPORT_SYMBOL(memcg_tcp_enter_memory_pressure);
