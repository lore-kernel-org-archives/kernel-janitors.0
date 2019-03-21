From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 21 Mar 2019 08:58:41 +0000
Subject: Re: [PATCH net-next] tipc: fix return value check in tipc_mcast_send_sync()
Message-Id: <771238ae-6e47-cac2-7dfe-f44475e90e43@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321085810.96037-1-weiyongjun1@huawei.com>
In-Reply-To: <20190321085810.96037-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>, Hoang Le <hoang.h.le@dektech.com.au>
Cc: netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org



On 03/21/2019 01:58 AM, Wei Yongjun wrote:
> Fix the return value check which testing the wrong variable
> in tipc_mcast_send_sync().
> 
> Fixes: c55c8edafa91 ("tipc: smooth change between replicast and broadcast")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  net/tipc/bcast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/tipc/bcast.c b/net/tipc/bcast.c
> index 5264a8ff6e01..a41c0fa9c650 100644
> --- a/net/tipc/bcast.c
> +++ b/net/tipc/bcast.c
> @@ -329,7 +329,7 @@ static int tipc_mcast_send_sync(struct net *net, struct sk_buff *skb,
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
> 

Thanks for the patch, but some 'Reported-by:' tags are missing :/
