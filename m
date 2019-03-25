From: Jon Maloy <jon.maloy@ericsson.com>
Date: Mon, 25 Mar 2019 16:29:53 +0000
Subject: RE: [PATCH net-next v2] tipc: fix return value check in tipc_mcast_send_sync()
Message-Id: <BL0PR1501MB2003436BC5DC77413EEF3B799A5E0@BL0PR1501MB2003.namprd15.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321085810.96037-1-weiyongjun1@huawei.com>
 <20190325063109.173692-1-weiyongjun1@huawei.com>
In-Reply-To: <20190325063109.173692-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Ying Xue <ying.xue@windriver.com>, Hoang Huu Le <hoang.h.le@dektech.com.au>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

Acked-by: Jon Maloy <jon.maloy@ericsson.com>

> -----Original Message-----
> From: netdev-owner@vger.kernel.org <netdev-owner@vger.kernel.org>
> On Behalf Of Wei Yongjun
> Sent: 25-Mar-19 07:31
> To: Jon Maloy <jon.maloy@ericsson.com>; Ying Xue
> <ying.xue@windriver.com>; Hoang Huu Le <hoang.h.le@dektech.com.au>;
> Eric Dumazet <eric.dumazet@gmail.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; netdev@vger.kernel.org;
> tipc-discussion@lists.sourceforge.net; kernel-janitors@vger.kernel.org; Hulk
> Robot <hulkci@huawei.com>
> Subject: [PATCH net-next v2] tipc: fix return value check in
> tipc_mcast_send_sync()
> 
> Fix the return value check which testing the wrong variable in
> tipc_mcast_send_sync().
> 
> Fixes: c55c8edafa91 ("tipc: smooth change between replicast and broadcast")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: add reported-by
> ---
>  net/tipc/bcast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/tipc/bcast.c b/net/tipc/bcast.c index
> 88edfb358ae7..76e14dc08bb9 100644
> --- a/net/tipc/bcast.c
> +++ b/net/tipc/bcast.c
> @@ -329,7 +329,7 @@ static int tipc_mcast_send_sync(struct net *net,
> struct sk_buff *skb,
> 
>  	/* Allocate dummy message */
>  	_skb = tipc_buf_acquire(MCAST_H_SIZE, GFP_KERNEL);
> -	if (!skb)
> +	if (!_skb)
>  		return -ENOMEM;
> 
>  	/* Preparing for 'synching' header */
> 
> 
