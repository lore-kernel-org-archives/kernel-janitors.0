From: David Miller <davem@davemloft.net>
Date: Tue, 01 Jun 2010 07:27:21 +0000
Subject: Re: [PATCH] ipv6: get rid of ipip6_prl_lock
Message-Id: <20100601.002721.184817854.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275252912.2472.23.camel@edumazet-laptop>
	<Pine.LNX.4.64.1005302303180.19253@ask.diku.dk>
	<1275282295.2472.34.camel@edumazet-laptop>
In-Reply-To: <1275282295.2472.34.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric.dumazet@gmail.com
Cc: julia@diku.dk, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 31 May 2010 07:04:55 +0200

> [PATCH] ipv6: get rid of ipip6_prl_lock
> 
> As noticed by Julia Lawall, ipip6_tunnel_add_prl() incorrectly calls 
> kzallloc(..., GFP_KERNEL) while a spinlock is held. She provided
> a patch to use GFP_ATOMIC instead.
> 
> One possibility would be to convert this spinlock to a mutex, or
> preallocate the thing before taking the lock.
> 
> After RCU conversion, it appears we dont need this lock, since 
> caller already holds RTNL
> 
> Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied, thanks everyone.
