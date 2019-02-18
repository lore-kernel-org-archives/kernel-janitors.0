From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 10:25:57 +0000
Subject: Re: [PATCH] net/mlx4_en: fix spelling mistake: "quiting" -> "quitting"
Message-Id: <20190218102557.GC17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190217230331.18678-1-colin.king@canonical.com>
 <2a1a6636-7795-addb-d7b7-711a23dbafa5@mellanox.com>
In-Reply-To: <2a1a6636-7795-addb-d7b7-711a23dbafa5@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Toukan <tariqt@mellanox.com>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 18, 2019 at 09:37:22AM +0000, Tariq Toukan wrote:
> 
> 
> On 2/18/2019 1:03 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a en_err error message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> > index 6b88881b8e35..c1438ae52a11 100644
> > --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> > +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> > @@ -3360,7 +3360,7 @@ int mlx4_en_init_netdev(struct mlx4_en_dev *mdev, int port,
> >   	dev->addr_len = ETH_ALEN;
> >   	mlx4_en_u64_to_mac(dev->dev_addr, mdev->dev->caps.def_mac[priv->port]);
> >   	if (!is_valid_ether_addr(dev->dev_addr)) {
> > -		en_err(priv, "Port: %d, invalid mac burned: %pM, quiting\n",
> > +		en_err(priv, "Port: %d, invalid mac burned: %pM, quitting\n",
> >   		       priv->port, dev->dev_addr);
> >   		err = -EINVAL;
> >   		goto out;
> > 
> 
> Hi Colin, thanks for your patch.
> 
> Reviewed-by: Tariq Toukan <tariqt@mellanox.com>
> 
> I would suggest adding a Fixes line, but looking into the history of the 
> typo, it went through many patches that modified this line but preserved 
> the typo.
> Actually, it dates back to the very first commit that introduces mlx4 
> driver:
> 
> Patches history:
> 2b3ddf27f48c net/mlx4_core: Replace VF zero mac with random mac in mlx4_core
> ef96f7d46ad8 net/mlx4_en: Handle unassigned VF MAC address correctly
> 6bbb6d99f3d2 net/mlx4_en: Optimize Rx fast path filter checks
> 453a60827735 mlx4_en: Giving interface name in debug messages
> c27a02cd94d6 mlx4_en: Add driver for Mellanox ConnectX 10GbE NIC
> 
> I'm not sure what the "Fixes:" policy is in these cases.

I wouldn't necessarily put a Fixes tag on this, because does fixing the
spelling really count as a bugfix?  It's borderline whether it's a fix
or a cleanup.

regards,
daan carpenter
