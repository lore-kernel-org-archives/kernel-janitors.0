From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Wed, 04 Apr 2018 07:24:10 +0000
Subject: Re: [PATCH v3] staging: vt6655: check for memory allocation failures
Message-Id: <20180404072410.GA31134@ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330024416epcas2p2f566f43a8f5af8b4ebc17659e3cf0ecf@epcas2p2.samsung.com>
 <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
 <20180403104052.6wbomdguifrmlmpz@mwanda>
In-Reply-To: <20180403104052.6wbomdguifrmlmpz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, baijiaju1990@gmail.com, forest@alittletooquiet.net, santhameena13@gmail.com

On Tue, Apr 03, 2018 at 01:40:52PM +0300, Dan Carpenter wrote:
> >  		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> > -
> > +		if (!desc->rd_info) {
> > +			ret = -ENOMEM;
> > +			goto error;
> > +		}
> >  		if (!device_alloc_rx_buf(priv, desc))
> >  			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
> >  
> 
> We need to handle the case where device_alloc_rx_buf() fails as well...

Hi Dan, thanks for your comments! I will write a patch v5 including this fix.

> Some years back, I wrote a post about error handling that might be
> helpful:
> https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ

This post is very helpful to me, Thank you.

> You are using "one err" and "do nothing" style error handling which are
> described in the post.

Sorry, I didn't fully understand "one err" and "do nothing" style error
handling of this code. The reason using goto instead of returns directly
was that for freeing previously allocated "rd_info"s in the for loop.
Please see below comment.


> > @@ -550,20 +554,29 @@ static void device_init_rd0_ring(struct vnt_private *priv)
> >  	if (i > 0)
> >  		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
> >  	priv->pCurrRD[0] = &priv->aRD0Ring[0];
> > +
> > +	return 0;
> > +error:
> > +	device_free_rd0_ring(priv);
> > +	return ret;
> >  }
> 
> Of course, Jia-Ju Bai is correct to say that this is a layering
> violation.  Each function should only clean up after its self.
> 
> Also, this is a very typical "one err" style bug which I explain about
> in my g+ post.  The rule that applies here is that you should only free
> things which have been allocated.  Since we only partially allocated the
> rd0 ring, device_free_rd0_ring() will crash when we do:
> 
> 		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
> 				 priv->rx_buf_sz, DMA_FROM_DEVICE);
> 
> "rd_info" is NULL so rd_info->skb_dma is a NULL dereference.

For dealing with this problem, I added below code on patch v3. I think it
would not make Null dereferencing issues, because it will not enter 
dma_unmap_single(), if "rd_info" is Null.

+               if (rd_info) {
+                       dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
+                                       priv->rx_buf_sz, DMA_FROM_DEVICE);
+                       dev_kfree_skb(rd_info->skb);
+                       kfree(desc->rd_info);
+               }

I would appreciate for your opinions what would be better way for freeing
allocated "rd_info"s in the loop previously.

Best regards,
Ji-Hun
