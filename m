From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Apr 2018 10:40:52 +0000
Subject: Re: [PATCH v3] staging: vt6655: check for memory allocation failures
Message-Id: <20180403104052.6wbomdguifrmlmpz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330024416epcas2p2f566f43a8f5af8b4ebc17659e3cf0ecf@epcas2p2.samsung.com>
 <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, baijiaju1990@gmail.com, forest@alittletooquiet.net, santhameena13@gmail.com

On Fri, Mar 30, 2018 at 11:44:04AM +0900, Ji-Hun Kim wrote:
> @@ -528,18 +528,22 @@ static void device_free_rings(struct vnt_private *priv)
>  				  priv->tx0_bufs, priv->tx_bufs_dma0);
>  }
>  
> -static void device_init_rd0_ring(struct vnt_private *priv)
> +static int device_init_rd0_ring(struct vnt_private *priv)
>  {
>  	int i;
>  	dma_addr_t      curr = priv->rd0_pool_dma;
>  	struct vnt_rx_desc *desc;
> +	int ret = 0;

Don't initialize "ret".  When you do that it disables static analysis to
find uninitialized variable warnings.

>  
>  	/* Init the RD0 ring entries */
>  	for (i = 0; i < priv->opts.rx_descs0;
>  	     i ++, curr += sizeof(struct vnt_rx_desc)) {
>  		desc = &priv->aRD0Ring[i];
>  		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> -
> +		if (!desc->rd_info) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
>  		if (!device_alloc_rx_buf(priv, desc))
>  			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
>  

We need to handle the case where device_alloc_rx_buf() fails as well...

Some years back, I wrote a post about error handling that might be
helpful:
https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ

You are using "one err" and "do nothing" style error handling which are
described in the post.


> @@ -550,20 +554,29 @@ static void device_init_rd0_ring(struct vnt_private *priv)
>  	if (i > 0)
>  		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
>  	priv->pCurrRD[0] = &priv->aRD0Ring[0];
> +
> +	return 0;
> +error:
> +	device_free_rd0_ring(priv);
> +	return ret;
>  }

Of course, Jia-Ju Bai is correct to say that this is a layering
violation.  Each function should only clean up after its self.

Also, this is a very typical "one err" style bug which I explain about
in my g+ post.  The rule that applies here is that you should only free
things which have been allocated.  Since we only partially allocated the
rd0 ring, device_free_rd0_ring() will crash when we do:

		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
				 priv->rx_buf_sz, DMA_FROM_DEVICE);

"rd_info" is NULL so rd_info->skb_dma is a NULL dereference.

regards,
dan carpenter

