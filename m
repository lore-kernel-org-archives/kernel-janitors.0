From: Ido Schimmel <idosch@idosch.org>
Date: Tue, 26 May 2020 23:29:25 +0000
Subject: Re: [PATCH] mlxsw: spectrum_router: remove redundant initialization of pointer br_dev
Message-Id: <20200526232925.GA1509289@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526225649.64257-1-colin.king@canonical.com>
In-Reply-To: <20200526225649.64257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 26, 2020 at 11:56:49PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
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

Colin, please drop the extra blank line and mention in subject prefix
that the patch is for net-next. Thanks!

>  		vid = vlan_dev_vlan_id(rif->dev);
>  		br_dev = vlan_dev_real_dev(rif->dev);
>  		if (WARN_ON(!netif_is_bridge_master(br_dev)))
> -- 
> 2.25.1
> 
