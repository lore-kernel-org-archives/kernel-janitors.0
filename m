From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Nov 2013 11:48:27 +0000
Subject: Re: [patch] vlynq: fix another resource size off by 1 error
Message-Id: <20131111114827.GE5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823081949.GD31293@elgon.mountain>
In-Reply-To: <20130823081949.GD31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

We still need to apply this fix.

regards,
dan carpenter

On Fri, Aug 23, 2013 at 11:19:49AM +0300, Dan Carpenter wrote:
> We fixed the call to request_mem_region() patch
> 3354f73 ('drivers/vlynq/vlynq.c: fix resource size off by 1 error').
> But we need to fix the call the release_mem_region() as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.
> 
> diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
> index 7b07135..c0227f9 100644
> --- a/drivers/vlynq/vlynq.c
> +++ b/drivers/vlynq/vlynq.c
> @@ -762,7 +762,8 @@ static int vlynq_remove(struct platform_device *pdev)
>  
>  	device_unregister(&dev->dev);
>  	iounmap(dev->local);
> -	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start);
> +	release_mem_region(dev->regs_start,
> +			   dev->regs_end - dev->regs_start + 1);
>  
>  	kfree(dev);
>  
