From: Jon Maloy <jon.maloy@ericsson.com>
Date: Mon, 26 Mar 2018 14:45:46 +0000
Subject: RE: [PATCH net-next] tipc: tipc_node_create() can be static
Message-Id: <BN6PR15MB15538D318F2D45E3D626FF5D9AAD0@BN6PR15MB1553.namprd15.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074793-22753-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074793-22753-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Ying Xue <ying.xue@windriver.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Acked-by: Jon Maloy <jon.maloy@ericsson.com>
Thanks
///jon

> -----Original Message-----
> From: Wei Yongjun [mailto:weiyongjun1@huawei.com]
> Sent: Monday, March 26, 2018 10:33
> To: Jon Maloy <jon.maloy@ericsson.com>; Ying Xue
> <ying.xue@windriver.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; netdev@vger.kernel.org;
> tipc-discussion@lists.sourceforge.net; kernel-janitors@vger.kernel.org
> Subject: [PATCH net-next] tipc: tipc_node_create() can be static
> 
> Fixes the following sparse warning:
> 
> net/tipc/node.c:336:18: warning:
>  symbol 'tipc_node_create' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  net/tipc/node.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/tipc/node.c b/net/tipc/node.c index 4a95c8c..4fb4327 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c
> @@ -333,8 +333,8 @@ static void tipc_node_write_unlock(struct tipc_node
> *n)
>  	}
>  }
> 
> -struct tipc_node *tipc_node_create(struct net *net, u32 addr,
> -				   u8 *peer_id, u16 capabilities)
> +static struct tipc_node *tipc_node_create(struct net *net, u32 addr,
> +					  u8 *peer_id, u16 capabilities)
>  {
>  	struct tipc_net *tn = net_generic(net, tipc_net_id);
>  	struct tipc_node *n, *temp_node;

