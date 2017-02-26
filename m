From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Sun, 26 Feb 2017 14:26:59 +0000
Subject: Re: [patch] RDMA/ocrdma: fix a type issue in ocrdma_put_pd_num()
Message-Id: <20170226142657.GA4053@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170223104016.GA27526@mwanda>
In-Reply-To: <20170223104016.GA27526@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Feb 23, 2017 at 01:40:16PM +0300, Dan Carpenter wrote:
> We want to return zero on success or negative error codes.  The type
> should be int and not u8.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> index e06ad7250963..b1b075763eaa 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> @@ -371,7 +371,7 @@ static int _ocrdma_pd_mgr_put_bitmap(struct ocrdma_dev *dev, u16 pd_id,
>  	return 0;
>  }
>  
> -static u8 ocrdma_put_pd_num(struct ocrdma_dev *dev, u16 pd_id,
> +static int ocrdma_put_pd_num(struct ocrdma_dev *dev, u16 pd_id,
>  				   bool dpp_pool)
>  {
>  	int status;
> --

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
