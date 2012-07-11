From: Hadar Hen Zion <hadarh@mellanox.com>
Date: Wed, 11 Jul 2012 15:01:47 +0000
Subject: Re: FW: [patch] net/mlx4_en: dereferencing freed memory
Message-Id: <4FFD955B.6020807@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <EB097B4067A7C64DA511817018705AE595EDE0BE@MTLDAG02.mtl.com>
In-Reply-To: <EB097B4067A7C64DA511817018705AE595EDE0BE@MTLDAG02.mtl.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, amirv@mellanox.com, Or Gerlitz <ogerlitz@mellanox.com>, Alexander Guller <alexg@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/11/2012 11:32 AM, Amir Vadai wrote:
>
>
> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, July 11, 2012 9:34 AM
> To: Yevgeny Petrilin
> Cc: David S. Miller; Amir Vadai; Or Gerlitz; Alexander Guller; netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] net/mlx4_en: dereferencing freed memory
>
> We dereferenced "mclist" after the kfree().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> index 94375a8..4ce5ca8 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> @@ -503,9 +503,7 @@ static void mlx4_en_do_set_multicast(struct work_struct *work)
>   				/* remove from list */
>   				list_del(&mclist->list);
>   				kfree(mclist);
> -			}
> -
> -			if (mclist->action = MCLIST_ADD) {
> +			} else if (mclist->action = MCLIST_ADD) {
>   				/* attach the address */
>   				memcpy(&mc_list[10], mclist->addr, ETH_ALEN);
>   				/* needed for B0 steering support */
>

Hi Dan,

It's the same in here. This is indeed a bug, thanks for spotting this over,

Please add:
Acked-by: Hadar Hen Zion <hadarh@mellanox.co.il>

Hadar

