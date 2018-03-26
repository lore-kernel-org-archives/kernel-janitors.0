From: Jon Maloy <jon.maloy@ericsson.com>
Date: Mon, 26 Mar 2018 14:44:57 +0000
Subject: RE: [PATCH net-next] tipc: fix error handling in tipc_udp_enable()
Message-Id: <BN6PR15MB15536FAE6945E5E4AD082EA29AAD0@BN6PR15MB1553.namprd15.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074764-22678-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074764-22678-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Ying Xue <ying.xue@windriver.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Acked-by: Jon Maloy <jon.maloy@ericsson.com>
Thank you, Wei.

> -----Original Message-----
> From: Wei Yongjun [mailto:weiyongjun1@huawei.com]
> Sent: Monday, March 26, 2018 10:33
> To: Jon Maloy <jon.maloy@ericsson.com>; Ying Xue
> <ying.xue@windriver.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; netdev@vger.kernel.org;
> tipc-discussion@lists.sourceforge.net; kernel-janitors@vger.kernel.org
> Subject: [PATCH net-next] tipc: fix error handling in tipc_udp_enable()
> 
> Release alloced resource before return from the error handling case in
> tipc_udp_enable(), otherwise will cause memory leak.
> 
> Fixes: 52dfae5c85a4 ("tipc: obtain node identity from interface by default")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  net/tipc/udp_media.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/tipc/udp_media.c b/net/tipc/udp_media.c index
> 2c13b18..e7d91f5 100644
> --- a/net/tipc/udp_media.c
> +++ b/net/tipc/udp_media.c
> @@ -687,7 +687,8 @@ static int tipc_udp_enable(struct net *net, struct
> tipc_bearer *b,
>  	}
>  	if (!tipc_own_id(net)) {
>  		pr_warn("Failed to set node id, please configure
> manually\n");
> -		return -EINVAL;
> +		err = -EINVAL;
> +		goto err;
>  	}
> 
>  	b->bcast_addr.media_id = TIPC_MEDIA_TYPE_UDP;

