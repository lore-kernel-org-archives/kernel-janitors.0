From: David Ahern <dsahern@gmail.com>
Date: Wed, 27 May 2020 01:15:36 +0000
Subject: Re: [PATCH] mlxsw: spectrum_router: remove redundant initialization of pointer br_dev
Message-Id: <77496adf-bddf-7911-dacb-f383b5ca6d17@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526225649.64257-1-colin.king@canonical.com>
In-Reply-To: <20200526225649.64257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/26/20 4:56 PM, Colin King wrote:
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> index 71aee4914619..8f485f9a07a7 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> @@ -7572,11 +7572,12 @@ static struct mlxsw_sp_fid *
>  mlxsw_sp_rif_vlan_fid_get(struct mlxsw_sp_rif *rif,
>  			  struct netlink_ext_ack *extack)
>  {
> -	struct net_device *br_dev = rif->dev;
> +	struct net_device *br_dev;
>  	u16 vid;
>  	int err;
>  
>  	if (is_vlan_dev(rif->dev)) {
> +

stray newline added


>  		vid = vlan_dev_vlan_id(rif->dev);
>  		br_dev = vlan_dev_real_dev(rif->dev);
>  		if (WARN_ON(!netif_is_bridge_master(br_dev)))
> 
