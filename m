From: Florian Fainelli <florian@openwrt.org>
Date: Mon, 21 Mar 2011 12:25:48 +0000
Subject: Re: [patch] vlynq: fix resource size calculation
Message-Id: <201103211325.49061.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319043813.GA2008@bicker>
In-Reply-To: <20110319043813.GA2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Saturday 19 March 2011 05:38:13 Dan Carpenter wrote:
> The original code had an off-by-one error so we didn't release the
> entire memory region on remove().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Florian Fainelli <florian@openwrt.org>

> 
> diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
> index f885c86..1d37553 100644
> --- a/drivers/vlynq/vlynq.c
> +++ b/drivers/vlynq/vlynq.c
> @@ -764,7 +764,7 @@ static int vlynq_remove(struct platform_device *pdev)
> 
>  	device_unregister(&dev->dev);
>  	iounmap(dev->local);
> -	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start);
> +	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start + 1);
> 
>  	kfree(dev);

