From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Thu, 08 Apr 2010 08:14:51 +0000
Subject: Re: [patch] mtd: silence compile warning
Message-Id: <1270714491.6754.99.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322115819.GA21571@bicker>
In-Reply-To: <20100322115819.GA21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Mon, 2010-03-22 at 15:02 +0300, Dan Carpenter wrote:
> This gets rid of a compile warning:
> drivers/mtd/maps/dmv182.c:120: warning: format ‘%d’ expects type 
> 	‘int’, but argument 2 has type ‘uint64_t’
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/maps/dmv182.c b/drivers/mtd/maps/dmv182.c
> index d171674..680ba2d 100644
> --- a/drivers/mtd/maps/dmv182.c
> +++ b/drivers/mtd/maps/dmv182.c
> @@ -116,7 +116,7 @@ static int __init init_svme182(void)
>  		return -ENXIO;
>  	}
>  
> -	printk(KERN_NOTICE "SVME182 flash device: %dMiB at 0x%08x\n",
> +	printk(KERN_NOTICE "SVME182 flash device: %lldMiB at 0x%08x\n",
>  		   this_mtd->size >> 20, FLASH_BASE_ADDR);

%lld is also wrong for uint64_t, I think on PPC it'll result in a
warning. Instead, I'd use %llu and then a cast:

(unsigned long long)(this_mtd->size >> 20)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

