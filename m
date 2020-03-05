From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2020 08:00:04 +0000
Subject: Re: [PATCH] net/mlx5e: Fix an IS_ERR() vs NULL check
Message-Id: <20200305080004.GA19839@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304142151.qivcobp6ngrynb2p@kili.mountain>
 <10527910074442142431505e9d424af9128e8c5c.camel@mellanox.com>
In-Reply-To: <10527910074442142431505e9d424af9128e8c5c.camel@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Eli Cohen <eli@mellanox.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Mark Bloch <markb@mellanox.com>, Paul Blakey <paulb@mellanox.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "leon@kernel.org" <leon@kernel.org>

On Wed, Mar 04, 2020 at 08:31:13PM +0000, Saeed Mahameed wrote:
> On Wed, 2020-03-04 at 17:22 +0300, Dan Carpenter wrote:
> > The esw_vport_tbl_get() function returns error pointers on error.
> > 
> > Fixes: 96e326878fa5 ("net/mlx5e: Eswitch, Use per vport tables for
> > mirroring")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Hi Dan the patch looks fine, but you didn't cc netdev mailing list
> Two options:
> 
> 1) I can pick this patch up and repost it myself in a future pull
> request

I assumed we would do this, because the original patch didn't have
Dave's signed-off-by.

> 2) you can re-post it and cc netdev also mark it for net [PATCH net]

If we were going to go that route then it would have to [PATCH net-next]
because it doesn't apply to the net tree.

regards,
dan carpenter
