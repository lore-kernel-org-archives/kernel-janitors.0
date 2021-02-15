From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Feb 2021 08:30:51 +0000
Subject: Re: [PATCH 1/2 net-next] net/mlx5e: TC: Fix IS_ERR() vs NULL checks
Message-Id: <20210215083050.GA2222@kadam>
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
> That was implement like that on purpose. If mlx5_tc_init_ct returns NULL it means the device doesn’t support CT offload which can happen with older devices or old FW on the devices.
> However, in this case we want to continue with the rest of the Tc initialization because we can still support other TC offloads. No need to fail the entire TC init in this case. Only if mlx5_tc_init_ct return err_ptr that means the tc init failed not because of lack of support but due to a real error and only then we want to fail the rest of the tc init.
> 
> Your change will break compatibility for devices/FW versions that don’t have CT offload support.
> 

When we have a function like this which is optional then returning NULL
is a special kind of success as you say.  Returning NULL should not
generate a warning message.  At the same time, if the user enables the
option and the code fails because we are low on memory then returning an
error pointer is the correct behavior.  Just because the feature is
optional does not mean we should ignore what the user told us to do.

This code never returns error pointers.  It always returns NULL/success
when an allocation fails.  That triggers the first static checker
warning from last year.  Now Smatch is complaining about a new static
checker warning:

drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:4754
mlx5e_tc_esw_init() warn: missing error code here? 'IS_ERR()' failed. 'err' = '0'

  4708  int mlx5e_tc_esw_init(struct rhashtable *tc_ht)
  4709  {
  4710          const size_t sz_enc_opts = sizeof(struct tunnel_match_enc_opts);
  4711          struct mlx5_rep_uplink_priv *uplink_priv;
  4712          struct mlx5e_rep_priv *rpriv;
  4713          struct mapping_ctx *mapping;
  4714          struct mlx5_eswitch *esw;
  4715          struct mlx5e_priv *priv;
  4716          int err = 0;
  4717  
  4718          uplink_priv = container_of(tc_ht, struct mlx5_rep_uplink_priv, tc_ht);
  4719          rpriv = container_of(uplink_priv, struct mlx5e_rep_priv, uplink_priv);
  4720          priv = netdev_priv(rpriv->netdev);
  4721          esw = priv->mdev->priv.eswitch;
  4722  
  4723          uplink_priv->ct_priv = mlx5_tc_ct_init(netdev_priv(priv->netdev),
  4724                                                 esw_chains(esw),
  4725                                                 &esw->offloads.mod_hdr,
  4726                                                 MLX5_FLOW_NAMESPACE_FDB);
  4727          if (IS_ERR(uplink_priv->ct_priv))
  4728                  goto err_ct;

If mlx5_tc_ct_init() fails, which it should do if kmalloc() fails but
currently it does not, then the error should be propagated all the way
back.  So this code should preserve the error code instead of returning
success.

  4729  
  4730          mapping = mapping_create(sizeof(struct tunnel_match_key),
  4731                                   TUNNEL_INFO_BITS_MASK, true);

regards,
dan carpenter
