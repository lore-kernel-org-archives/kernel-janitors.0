From: Dave Jiang <dave.jiang@intel.com>
Date: Fri, 17 Nov 2017 21:44:17 +0000
Subject: Re: [PATCH] dmaengine: ioat: Fix error handling path
Message-Id: <6d1e724c-bc0c-cef1-2ac1-616a36ed7a48@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171117213753.21050-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171117213753.21050-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Williams, Dan J" <dan.j.williams@intel.com>, "Koul, Vinod" <vinod.koul@intel.com>, "bianpan2016@163.com" <bianpan2016@163.com>, "arvind.yadav.cs@gmail.com" <arvind.yadav.cs@gmail.com>, "kjlx@templeofstupid.com" <kjlx@templeofstupid.com>, "geliangtang@gmail.com" <geliangtang@gmail.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



On 11/17/2017 02:37 PM, Christophe JAILLET wrote:
> If the last test in 'ioat_dma_self_test()' fails, we must release all
> the allocated resources and not just part of them.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Good catch! Thanks! Acked-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/ioat/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index 2f31d3d0caa6..7792a9186f9c 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -390,7 +390,7 @@ static int ioat_dma_self_test(struct ioatdma_device *ioat_dma)
>  	if (memcmp(src, dest, IOAT_TEST_SIZE)) {
>  		dev_err(dev, "Self-test copy failed compare, disabling\n");
>  		err = -ENODEV;
> -		goto free_resources;
> +		goto unmap_dma;
>  	}
>  
>  unmap_dma:
> 
