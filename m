From: Joe Perches <joe@perches.com>
Date: Sat, 10 Dec 2016 11:27:50 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <1481369270.5946.51.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
In-Reply-To: <20161210090618.GA11680@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2016-12-10 at 12:06 +0300, Dan Carpenter wrote:
> We really don't care where "ctrl" is on the stack since we're just
> returning soon what we want is the actual ctrl pointer itself.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
[]
> @@ -2402,7 +2402,7 @@ enum blk_eh_timer_return
>  
>  	dev_info(ctrl->ctrl.device,
>  		"NVME-FC{%d}: new ctrl: NQN \"%s\" (%p)\n",
> -		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, &ctrl);
> +		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, ctrl);

Found by script or inspection?

If by script, it seems unlikely there's only 1 instance
where an address of an automatic pointer type is used
incorrectly.
