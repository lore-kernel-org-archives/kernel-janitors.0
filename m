From: Mark Bloch <markb@mellanox.com>
Date: Wed, 01 Jun 2016 05:20:49 +0000
Subject: RE: [patch] IB/core: fix an error code in ib_core_init()
Message-Id: <VI1PR05MB139180122CFC8788CDBE819AD2470@VI1PR05MB1391.eurprd05.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160531160556.GA23959@mwanda>
In-Reply-To: <20160531160556.GA23959@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Haggai Eran <haggaie-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "Yotam Kenneth (revoke on 13.10.15)" <yotamke-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Parav Pandit <pandit.parav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Nice catch, looks good.

Reviewed-by: Mark Bloch <markb@mellanox.com>

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, May 31, 2016 7:06 PM
> To: Doug Ledford <dledford@redhat.com>; Mark Bloch
> <markb@mellanox.com>
> Cc: Sean Hefty <sean.hefty@intel.com>; Hal Rosenstock
> <hal.rosenstock@gmail.com>; Matan Barak <matanb@mellanox.com>; Or
> Gerlitz <ogerlitz@mellanox.com>; Ira Weiny <ira.weiny@intel.com>; Haggai
> Eran <haggaie@mellanox.com>; Leon Romanovsky
> <leonro@mellanox.com>; Jason Gunthorpe
> <jgunthorpe@obsidianresearch.com>; Yotam Kenneth (revoke on 13.10.15)
> <yotamke@mellanox.com>; Parav Pandit <pandit.parav@gmail.com>; linux-
> rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] IB/core: fix an error code in ib_core_init()
> 
> We should return the error code if ib_add_ibnl_clients() fails.  The
> current code returns success.
> 
> Fixes: 735c631ae99d ('IB/core: Register SA ibnl client during ib_core
> initialization')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/core/device.c
> b/drivers/infiniband/core/device.c
> index 5516fb0..8b8a8d9 100644
> --- a/drivers/infiniband/core/device.c
> +++ b/drivers/infiniband/core/device.c
> @@ -1024,7 +1024,8 @@ static int __init ib_core_init(void)
>  		goto err_mad;
>  	}
> 
> -	if (ib_add_ibnl_clients()) {
> +	ret = ib_add_ibnl_clients();
> +	if (ret) {
>  		pr_warn("Couldn't register ibnl clients\n");
>  		goto err_sa;
>  	}
