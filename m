From: Tariq Toukan <tariqt@mellanox.com>
Date: Wed, 23 May 2018 07:26:34 +0000
Subject: Re: [PATCH][V2] net/mlx4: fix spelling mistake: "Inrerface" -> "Interface" and rephrase message
Message-Id: <cba3d286-3e89-3d58-a55c-de0107b3abcf@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180522154251.16789-1-colin.king@canonical.com>
In-Reply-To: <20180522154251.16789-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tariq Toukan <tariqt@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 22/05/2018 6:42 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in mlx4_dbg debug message and also
> change the phrasing of the message so that is is more readable
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> ---
> V2: rephrase message, as helpfully suggested by Tariq Toukan
> ---
>   drivers/net/ethernet/mellanox/mlx4/intf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/intf.c b/drivers/net/ethernet/mellanox/mlx4/intf.c
> index 2edcce98ab2d..65482f004e50 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/intf.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/intf.c
> @@ -172,7 +172,7 @@ int mlx4_do_bond(struct mlx4_dev *dev, bool enable)
>   		list_add_tail(&dev_ctx->list, &priv->ctx_list);
>   		spin_unlock_irqrestore(&priv->ctx_lock, flags);
>   
> -		mlx4_dbg(dev, "Inrerface for protocol %d restarted with when bonded mode is %s\n",
> +		mlx4_dbg(dev, "Interface for protocol %d restarted with bonded mode %s\n",
>   			 dev_ctx->intf->protocol, enable ?
>   			 "enabled" : "disabled");
>   	}
> 

Thanks Colin.

Reviewed-by: Tariq Toukan <tariqt@mellanox.com>

