From: Tariq Toukan <tariqt@mellanox.com>
Date: Tue, 30 Jun 2020 16:30:15 +0000
Subject: Re: [PATCH][next] net/mlx5e: fix memory leak of tls
Message-Id: <7c3bb6e8-6658-1a73-b5c7-b70bc6255576@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200630151646.517757-1-colin.king@canonical.com>
In-Reply-To: <20200630151646.517757-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Pismenny <borisp@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 6/30/2020 6:16 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The error return path when create_singlethread_workqueue fails currently
> does not kfree tls and leads to a memory leak. Fix this by kfree'ing
> tls before returning -ENOMEM.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 1182f3659357 ("net/mlx5e: kTLS, Add kTLS RX HW offload support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en_accel/tls.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/tls.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/tls.c
> index 99beb928feff..fee991f5ee7c 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/tls.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/tls.c
> @@ -232,8 +232,10 @@ int mlx5e_tls_init(struct mlx5e_priv *priv)
>   		return -ENOMEM;
>   
>   	tls->rx_wq = create_singlethread_workqueue("mlx5e_tls_rx");
> -	if (!tls->rx_wq)
> +	if (!tls->rx_wq) {
> +		kfree(tls);
>   		return -ENOMEM;
> +	}
>   
>   	priv->tls = tls;
>   	return 0;
> 

Reviewed-by: Tariq Toukan <tariqt@mellanox.com>
Thanks.
