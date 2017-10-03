From: Yotam Gigi <yotamg@mellanox.com>
Date: Tue, 03 Oct 2017 10:58:18 +0000
Subject: Re: [PATCH 1/2 net-next] mlxsw: spectrum: Fix check for IS_ERR() instead of NULL
Message-Id: <e98867d3-0672-1f0a-b45e-3ba7bd44d9b5@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003105303.u7yrzxknddmmerol@mwanda>
In-Reply-To: <20171003105303.u7yrzxknddmmerol@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jiri Pirko <jiri@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/03/2017 01:53 PM, Dan Carpenter wrote:
> mlxsw_afa_block_create() doesn't return error pointers, it returns NULL
> on error.
>
> Fixes: 0e14c7777acb ("mlxsw: spectrum: Add the multicast routing hardware logic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Yotam Gigi <yotamg@mellanox.com>

Thanks!

>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
> index cda9e9ad10e3..5e4ccbf17e3d 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
> @@ -239,8 +239,8 @@ mlxsw_sp_mr_tcam_afa_block_create(struct mlxsw_sp *mlxsw_sp,
>  	int err;
>  
>  	afa_block = mlxsw_afa_block_create(mlxsw_sp->afa);
> -	if (IS_ERR(afa_block))
> -		return afa_block;
> +	if (!afa_block)
> +		return ERR_PTR(-ENOMEM);
>  
>  	err = mlxsw_afa_block_append_counter(afa_block, counter_index);
>  	if (err)

