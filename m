From: Matan Barak <matanb@mellanox.com>
Date: Wed, 13 Jul 2016 11:19:06 +0000
Subject: Re: [patch] net/mlx5: missing error code in esw_create_offloads_fdb_table()
Message-Id: <83d5a5bb-dbf5-6c8f-39ea-320d55026a9d@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100825.GD29468@mwanda>
In-Reply-To: <20160713100825.GD29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 13/07/2016 13:08, Dan Carpenter wrote:
> We accidentally return success when we had intended to return an error
> code.
>
> Fixes: 69697b6e2086 ('net/mlx5: E-Switch, Add support for the sriov offloads mode')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> index 1842dfb..7d982cf 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> @@ -183,6 +183,7 @@ static int esw_create_offloads_fdb_table(struct mlx5_eswitch *esw, int nvports)
>
>  	root_ns = mlx5_get_flow_namespace(dev, MLX5_FLOW_NAMESPACE_FDB);
>  	if (!root_ns) {
> +		err = -EINVAL;
>  		esw_warn(dev, "Failed to get FDB flow namespace\n");
>  		goto ns_err;
>  	}
>

Hi,

Thanks for the patch.
I'm not sure EINVAL is the right error here though.
Maybe -ENOTSUPP is a bit more appropriate here.

Regards,
Matan
