From: Tariq Toukan <tariqt@mellanox.com>
Date: Mon, 12 Mar 2018 08:42:56 +0000
Subject: Re: [PATCH] net/mlx4_en: Fix a memory leak in case of error in 'mlx4_en_init_netdev()'
Message-Id: <a61ed690-7df1-7292-4074-3f7d66c0b490@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311224529.4427-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180311224529.4427-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tariqt@mellanox.com
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 12/03/2018 12:45 AM, Christophe JAILLET wrote:
> If 'kzalloc' fails, we must free some memory before returning.
> 
> Fixes: 67f8b1dcb9ee ("net/mlx4_en: Refactor the XDP forwarding rings scheme")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> index 8fc51bc29003..f9db018e858f 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> @@ -3327,7 +3327,7 @@ int mlx4_en_init_netdev(struct mlx4_en_dev *mdev, int port,
>   		if (!priv->tx_cq[t]) {
>   			kfree(priv->tx_ring[t]);
>   			err = -ENOMEM;
> -			goto out;
> +			goto err_free_tx;
>   		}
>   	}
>   	priv->rx_ring_num = prof->rx_ring_num;
> 

Hi Christophe, thanks for spotting this.

However, I think these err_free_tx label and loop are redundant.
Both tx_ring/tx_cq flows should just goto out, as resources are freed 
later in mlx4_en_destroy_netdev() -> mlx4_en_free_resources().
