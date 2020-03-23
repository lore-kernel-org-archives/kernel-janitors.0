From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2020 10:02:16 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Fix actions_match_supported() return
Message-Id: <20200323100215.GB26299@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132305.GB95012@mwanda>
 <35fcb57643c0522b051318e75b106100422fb1dc.camel@mellanox.com>
In-Reply-To: <35fcb57643c0522b051318e75b106100422fb1dc.camel@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Paul Blakey <paulb@mellanox.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Roi Dayan <roid@mellanox.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, Oz Shlomo <ozsh@mellanox.com>, "leon@kernel.org" <leon@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Sat, Mar 21, 2020 at 02:43:08AM +0000, Saeed Mahameed wrote:
> On Fri, 2020-03-20 at 16:23 +0300, Dan Carpenter wrote:
> > The actions_match_supported() function returns a bool, true for
> > success
> > and false for failure.  This error path is returning a negative which
> > is cast to true but it should return false.
> > 
> > Fixes: 4c3844d9e97e ("net/mlx5e: CT: Introduce connection tracking")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > index 044891a03be3..e5de7d2bac2b 100644
> > --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > @@ -3058,7 +3058,7 @@ static bool actions_match_supported(struct
> > mlx5e_priv *priv,
> >  			 */
> >  			NL_SET_ERR_MSG_MOD(extack,
> >  					   "Can't offload mirroring
> > with action ct");
> > -			return -EOPNOTSUPP;
> > +			return false;
> >  		}
> >  	} else {
> >  		actions = flow->nic_attr->action;
> 
> applied to net-next-mlx5 

I can never figure out which tree these are supposed to be applied to.
:(  Is there a trick to it?

regards,
dan carpenter
