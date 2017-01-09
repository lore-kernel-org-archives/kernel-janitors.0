From: Shiraz Saleem <shiraz.saleem@intel.com>
Date: Mon, 09 Jan 2017 19:41:27 +0000
Subject: Re: [patch] i40iw: fix some indenting in i40iw_sc_vsi_init()
Message-Id: <20170109194127.GA42156@ssaleem-MOBL4.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170107063042.GD26959@elgon.mountain>
In-Reply-To: <20170107063042.GD26959-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Chien Tin Tung <chien.tin.tung-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Jan 07, 2017 at 09:30:42AM +0300, Dan Carpenter wrote:
> The debug printk was indented more than it should have been and we
> can remove an unnecessary line break.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> index 98923a8cf86d..b9dc2c540946 100644
> --- a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> +++ b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
> @@ -4498,9 +4498,9 @@ void i40iw_sc_vsi_init(struct i40iw_sc_vsi *vsi, struct i40iw_vsi_init_info *inf
>  	i40iw_fill_qos_list(info->params->qs_handle_list);
>  
>  	for (i = 0; i < I40IW_MAX_USER_PRIORITY; i++) {
> -		vsi->qos[i].qs_handle > -			info->params->qs_handle_list[i];
> -			i40iw_debug(vsi->dev, I40IW_DEBUG_DCB, "qset[%d]: %d\n", i, vsi->qos[i].qs_handle);
> +		vsi->qos[i].qs_handle =	info->params->qs_handle_list[i];
It appears there is a tab char after the =. Rather than a space.
   
> +		i40iw_debug(vsi->dev, I40IW_DEBUG_DCB, "qset[%d]: %d\n", i,
> +			    vsi->qos[i].qs_handle);
>  		spin_lock_init(&vsi->qos[i].lock);
>  		INIT_LIST_HEAD(&vsi->qos[i].qplist);
>  	}
