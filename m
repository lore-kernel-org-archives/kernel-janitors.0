From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 18:51:03 +0000
Subject: Re: [PATCH 1/2 net-next] net/mlx5e: TC: Fix IS_ERR() vs NULL checks
Message-Id: <20200928185103.GT4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928174153.GA446008@mwanda>
 <3F057952-3C88-452F-BFC5-4DC2B87FAD67@nvidia.com>
In-Reply-To: <3F057952-3C88-452F-BFC5-4DC2B87FAD67@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ariel Levkovich <lariel@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Roi Dayan <roid@mellanox.com>, Ariel Levkovich <lariel@mellanox.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Sep 28, 2020 at 06:31:04PM +0000, Ariel Levkovich wrote:
> On Sep 28, 2020, at 13:42, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > ﻿The mlx5_tc_ct_init() function doesn't return error pointers it returns
> > NULL.  Also we need to set the error codes on this path.
> > 
> > Fixes: aedd133d17bc ("net/mlx5e: Support CT offload for tc nic flows")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > index 104b1c339de0..438fbcf478d1 100644
> > --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > @@ -5224,8 +5224,10 @@ int mlx5e_tc_nic_init(struct mlx5e_priv *priv)
> > 
> >    tc->ct = mlx5_tc_ct_init(priv, tc->chains, &priv->fs.tc.mod_hdr,
> >                 MLX5_FLOW_NAMESPACE_KERNEL);
> > -    if (IS_ERR(tc->ct))
> > +    if (!tc->ct) {
> > +        err = -ENOMEM;
> >        goto err_ct;
> > +    }
> 
> Hi Dan,
> That was implement like that on purpose. If mlx5_tc_init_ct returns
> NULL it means the device doesn’t support CT offload which can happen
> with older devices or old FW on the devices.
> However, in this case we want to continue with the rest of the Tc
> initialization because we can still support other TC offloads. No
> need to fail the entire TC init in this case. Only if mlx5_tc_init_ct
> return err_ptr that means the tc init failed not because of lack of
> support but due to a real error and only then we want to fail the rest
> of the tc init.
> 
> Your change will break compatibility for devices/FW versions that
> don’t have CT offload support.
> 

I should have looked at this more closely.  It seems the bug is in
mlx5_tc_ct_init().

drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c
  1897  struct mlx5_tc_ct_priv *
  1898  mlx5_tc_ct_init(struct mlx5e_priv *priv, struct mlx5_fs_chains *chains,
  1899                  struct mod_hdr_tbl *mod_hdr,
  1900                  enum mlx5_flow_namespace_type ns_type)
  1901  {
  1902          struct mlx5_tc_ct_priv *ct_priv;
  1903          struct mlx5_core_dev *dev;
  1904          const char *msg;
  1905          int err;
  1906  
  1907          dev = priv->mdev;
  1908          err = mlx5_tc_ct_init_check_support(priv, ns_type, &msg);
  1909          if (err) {
  1910                  mlx5_core_warn(dev,
  1911                                 "tc ct offload not supported, %s\n",
  1912                                 msg);
  1913                  goto err_support;

This should probably return NULL and it does.

  1914          }
  1915  
  1916          ct_priv = kzalloc(sizeof(*ct_priv), GFP_KERNEL);
  1917          if (!ct_priv)
  1918                  goto err_alloc;

This should probably return an ERR_PTR(-ENOMEM) but it instead returns
NULL.

  1919  
  1920          ct_priv->zone_mapping = mapping_create(sizeof(u16), 0, true);
  1921          if (IS_ERR(ct_priv->zone_mapping)) {
  1922                  err = PTR_ERR(ct_priv->zone_mapping);
  1923                  goto err_mapping_zone;
                        ^^^^^^^^^^^^^^^^^^^^^^
This sets "err" but it still returns NULL.

Then in the caller if the mlx5_tc_ct_init() call returns an error
pointer, it should set the error code.  (NULL is a special case of
success etc).

Can you fix this and give me a reported-by tag?  I think my new analysis
is correct...

regards,
dan carpenter
