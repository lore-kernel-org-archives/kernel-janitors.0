From: Shiraz Saleem <shiraz.saleem@intel.com>
Date: Fri, 29 Sep 2017 14:26:25 +0000
Subject: Re: [PATCH] i40iw: delete some stray tabs
Message-Id: <20170929142625.GA15568@ssaleem-MOBL4.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929074943.cs2jea5xttk2r6vm@mwanda>
In-Reply-To: <20170929074943.cs2jea5xttk2r6vm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Sep 29, 2017 at 10:49:43AM +0300, Dan Carpenter wrote:
> These lines were indented too far by mistake.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/i40iw/i40iw_cm.c b/drivers/infiniband/hw/i40iw/i40iw_cm.c
> index 5230dd3c938c..9017c1cc51d4 100644
> --- a/drivers/infiniband/hw/i40iw/i40iw_cm.c
> +++ b/drivers/infiniband/hw/i40iw/i40iw_cm.c
> @@ -1524,8 +1524,8 @@ static bool i40iw_port_in_use(struct i40iw_cm_core *cm_core, u16 port, bool acti
>  				break;
>  			}
>  		}
> -			if (!ret)
> -				clear_bit(port, cm_core->active_side_ports);
> +		if (!ret)
> +			clear_bit(port, cm_core->active_side_ports);
>  		spin_unlock_irqrestore(&cm_core->ht_lock, flags);
>  	} else {
>  		spin_lock_irqsave(&cm_core->listen_list_lock, flags);
> --

Thanks Dan!
Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>

