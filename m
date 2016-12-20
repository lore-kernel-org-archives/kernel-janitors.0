From: James Smart <james.smart@broadcom.com>
Date: Tue, 20 Dec 2016 00:40:30 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <c73d9cb3-89f4-54d3-50b3-90b6b2f3df23@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
In-Reply-To: <20161210090618.GA11680@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan,

Mind if I solve this a different way ?  I really don't know why knowing 
the ptr value is even meaningful

-- james


On 12/10/2016 1:06 AM, Dan Carpenter wrote:
> We really don't care where "ctrl" is on the stack since we're just
> returning soon what we want is the actual ctrl pointer itself.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> index 771e2e761872..e6395ed2f562 100644
> --- a/drivers/nvme/host/fc.c
> +++ b/drivers/nvme/host/fc.c
> @@ -2402,7 +2402,7 @@ enum blk_eh_timer_return
>   
>   	dev_info(ctrl->ctrl.device,
>   		"NVME-FC{%d}: new ctrl: NQN \"%s\" (%p)\n",
> -		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, &ctrl);
> +		ctrl->cnum, ctrl->ctrl.opts->subsysnqn, ctrl);
>   
>   	kref_get(&ctrl->ctrl.kref);
>   

