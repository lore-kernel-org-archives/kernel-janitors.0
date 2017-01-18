From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Wed, 18 Jan 2017 19:54:34 +0000
Subject: Re: [PATCH] i40iw: Set maj_err and min_err in i40iw_sc_cqp_create
Message-Id: <20170118195433.GA17688@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1484761709-6072-1-git-send-email-shiraz.saleem@intel.com>
In-Reply-To: <1484761709-6072-1-git-send-email-shiraz.saleem-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shiraz Saleem <shiraz.saleem-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org

On Wed, Jan 18, 2017 at 11:48:29AM -0600, Shiraz Saleem wrote:
> Set maj_err and min_err in i40iw_sc_cqp_create so that it
> returns correct values for all return cases. This also
> addresses an uninitialized variable warning for maj_err and
> min_err in i40iw_create_cqp.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reported-by: Yuval Shaia <yuval.shaia@oracle.com>
> Signed-off-by: Shiraz Saleem <shiraz.saleem@intel.com>
> ---
>  drivers/infiniband/hw/i40iw/i40iw_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> index 2c4b4d0..47a2529 100644
> --- a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> +++ b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> @@ -315,6 +315,9 @@ static enum i40iw_status_code i40iw_sc_cqp_create(struct i40iw_sc_cqp *cqp,
>  	u32 cnt = 0, p1, p2, val = 0, err_code;
>  	enum i40iw_status_code ret_code;
>  
> +	*maj_err = 0;
> +	*min_err = 0;
> +

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

>  	ret_code = i40iw_allocate_dma_mem(cqp->dev->hw,
>  					  &cqp->sdbuf,
>  					  128,
> -- 
> 2.8.0
> 
