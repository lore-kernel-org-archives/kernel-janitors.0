From: Ido Schimmel <idosch@idosch.org>
Date: Wed, 18 Nov 2020 13:06:57 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum_router: Fix a double free on error
Message-Id: <20201118130657.GA335481@shredder.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118130048.GA334813@mwanda>
In-Reply-To: <20201118130048.GA334813@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 18, 2020 at 04:00:48PM +0300, Dan Carpenter wrote:
> There is a double free here because mlxsw_sp_nexthop6_group_create() and
> mlxsw_sp_nexthop6_group_info_init() free "nh_grp".  It should only be
> freed in the create function.
> 
> Fixes: 7f7a417e6a11 ("mlxsw: spectrum_router: Split nexthop group configuration to a different struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> index a2e81ad5790f..fde8667a2f60 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> @@ -5423,7 +5423,6 @@ mlxsw_sp_nexthop6_group_info_init(struct mlxsw_sp *mlxsw_sp,
>  		nh = &nhgi->nexthops[i];
>  		mlxsw_sp_nexthop6_fini(mlxsw_sp, nh);
>  	}
> -	kfree(nh_grp);

Thanks for the patch, Dan.

I already sent a patch yesterday:
https://patchwork.kernel.org/project/netdevbpf/patch/20201117174704.291990-2-idosch@idosch.org/

Note that it is different than yours. It frees 'nhgi' instead of
'nh_grp'. It was a typo.

>  	return err;
>  }
>  
> -- 
> 2.29.2
> 
