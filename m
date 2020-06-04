From: Roi Dayan <roid@mellanox.com>
Date: Thu, 04 Jun 2020 05:41:21 +0000
Subject: Re: [PATCH] net/mlx5: E-Switch, Fix an Oops error handling code
Message-Id: <3f29e5cd-f02d-3eb0-f2d6-601702c6a2ae@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603175316.GC18931@mwanda>
In-Reply-To: <20200603175316.GC18931@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Saeed Mahameed <saeedm@mellanox.com>, Vu Pham <vuhuong@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Mark Bloch <markb@mellanox.com>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2020-06-03 8:53 PM, Dan Carpenter wrote:
> The error handling dereferences "vport".  There is nothing we can do if
> it is an error pointer except returning the error code.
> 
> Fixes: 133dcfc577ea ("net/mlx5: E-Switch, Alloc and free unique metadata for match")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_ofld.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_ofld.c b/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_ofld.c
> index 4e55d7225a265..857f6193f3b14 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_ofld.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_ofld.c
> @@ -301,8 +301,7 @@ int mlx5_esw_acl_ingress_vport_bond_update(struct mlx5_eswitch *esw, u16 vport_n
>  
>  	if (WARN_ON_ONCE(IS_ERR(vport))) {
>  		esw_warn(esw->dev, "vport(%d) invalid!\n", vport_num);
> -		err = PTR_ERR(vport);
> -		goto out;
> +		return PTR_ERR(vport);
>  	}
>  
>  	esw_acl_ingress_ofld_rules_destroy(esw, vport);
> 

thanks!

Reviewed-by: Roi Dayan <roid@mellanox.com>
