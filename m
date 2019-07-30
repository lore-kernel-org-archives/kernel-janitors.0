From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 30 Jul 2019 12:22:59 +0000
Subject: Re: [PATCH][net-next][V2] mlxsw: spectrum_ptp: fix duplicated check on orig_egr_types
Message-Id: <d1907bca-a6f7-deb0-cffe-ba2561cfe608@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730114752.24133-1-colin.king@canonical.com>
In-Reply-To: <20190730114752.24133-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Machata <petrm@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

As pointed out by Petr, this should be [net] and not [net-next]


On 30/07/2019 12:47, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently are duplicated checks on orig_egr_types which are
> redundant, I believe this is a typo and should actually be
> orig_ing_types || orig_egr_types instead of the expression
> orig_egr_types || orig_egr_types.  Fix these.
> 
> Addresses-Coverity: ("Same on both sides")
> Fixes: c6b36bdd04b5 ("mlxsw: spectrum_ptp: Increase parsing depth when PTP is enabled")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
> index 98c5ba3200bc..63b07edd9d81 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
> @@ -999,14 +999,14 @@ static int mlxsw_sp1_ptp_mtpppc_update(struct mlxsw_sp_port *mlxsw_sp_port,
>  		}
>  	}
>  
> -	if ((ing_types || egr_types) && !(orig_egr_types || orig_egr_types)) {
> +	if ((ing_types || egr_types) && !(orig_ing_types || orig_egr_types)) {
>  		err = mlxsw_sp_nve_inc_parsing_depth_get(mlxsw_sp);
>  		if (err) {
>  			netdev_err(mlxsw_sp_port->dev, "Failed to increase parsing depth");
>  			return err;
>  		}
>  	}
> -	if (!(ing_types || egr_types) && (orig_egr_types || orig_egr_types))
> +	if (!(ing_types || egr_types) && (orig_ing_types || orig_egr_types))
>  		mlxsw_sp_nve_inc_parsing_depth_put(mlxsw_sp);
>  
>  	return mlxsw_sp1_ptp_mtpppc_set(mlxsw_sp_port->mlxsw_sp,
> 
> --
> 
> V2: fix both occurances of this typo. Thanks to Petr Machata for spotting
>     the 2nd occurrance
> 
