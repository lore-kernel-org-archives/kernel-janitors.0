From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 12 Jan 2015 08:35:55 +0000
Subject: Re: [patch] IB/mlx5: fix error code in get_port_caps()
Message-Id: <alpine.DEB.2.10.1501120934540.2476@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150112081429.GA11818@mwanda>
In-Reply-To: <20150112081429.GA11818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Eli Cohen <eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 12 Jan 2015, Dan Carpenter wrote:

> We should return -ENOMEM on allocation failure instead of success.

Probably not a big deal, but the commit message is not clear at all.  From
the fix, it doesn't look like the code was returning -ENOMEM on success.

julia

> Fixes: e126ba97dba9 ('mlx5: Add driver for Mellanox Connect-IB adapters')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
> index 8a87404..cc4ac1e 100644
> --- a/drivers/infiniband/hw/mlx5/main.c
> +++ b/drivers/infiniband/hw/mlx5/main.c
> @@ -997,7 +997,7 @@ static int get_port_caps(struct mlx5_ib_dev *dev)
>  	struct ib_device_attr *dprops = NULL;
>  	struct ib_port_attr *pprops = NULL;
>  	struct mlx5_general_caps *gen;
> -	int err = 0;
> +	int err = -ENOMEM;
>  	int port;
>
>  	gen = &dev->mdev->caps.gen;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
