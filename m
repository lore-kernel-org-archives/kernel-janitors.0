From: Matan Barak <matanb@mellanox.com>
Date: Wed, 13 Jul 2016 11:53:29 +0000
Subject: Re: [patch v2] net/mlx5: missing error code in esw_create_offloads_fdb_table()
Message-Id: <534c754e-5e58-ad98-f607-6df8c10e8022@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100825.GD29468@mwanda>
In-Reply-To: <20160713100825.GD29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 13/07/2016 14:48, Dan Carpenter wrote:
> We accidentally return success when we had intended to return an error
> code.
>
> Fixes: 69697b6e2086 ('net/mlx5: E-Switch, Add support for the sriov offloads mode')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: return -ENOTSUPP instead --EINVAL
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> index 1842dfb..7d982cf 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> @@ -183,6 +183,7 @@ static int esw_create_offloads_fdb_table(struct mlx5_eswitch *esw, int nvports)
>
>  	root_ns = mlx5_get_flow_namespace(dev, MLX5_FLOW_NAMESPACE_FDB);
>  	if (!root_ns) {
> +		err = -ENOTSUPP;
>  		esw_warn(dev, "Failed to get FDB flow namespace\n");
>  		goto ns_err;
>  	}
>

Thanks.

Reviewed-by: Matan Barak <matanb@mellanox.com>
