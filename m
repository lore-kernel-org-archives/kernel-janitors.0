From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Apr 2018 09:53:19 +0000
Subject: Re: [PATCH v3] staging: vt6655: check for memory allocation failures
Message-Id: <20180404095319.zshtp3cbyf6sxsfq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330024416epcas2p2f566f43a8f5af8b4ebc17659e3cf0ecf@epcas2p2.samsung.com>
 <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
 <20180403104052.6wbomdguifrmlmpz@mwanda>
 <20180404072410.GA31134@ubuntu>
In-Reply-To: <20180404072410.GA31134@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, baijiaju1990@gmail.com, forest@alittletooquiet.net, santhameena13@gmail.com

On Wed, Apr 04, 2018 at 04:24:10PM +0900, Ji-Hun Kim wrote:
> > Since we only partially allocated the
> > rd0 ring, device_free_rd0_ring() will crash when we do:
> > 
> > 		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
> > 				 priv->rx_buf_sz, DMA_FROM_DEVICE);
> > 
> > "rd_info" is NULL so rd_info->skb_dma is a NULL dereference.
> 
> For dealing with this problem, I added below code on patch v3. I think it
> would not make Null dereferencing issues, because it will not enter 
> dma_unmap_single(), if "rd_info" is Null.
> 
> +               if (rd_info) {
> +                       dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
> +                                       priv->rx_buf_sz, DMA_FROM_DEVICE);
> +                       dev_kfree_skb(rd_info->skb);
> +                       kfree(desc->rd_info);
> +               }
> 
> I would appreciate for your opinions what would be better way for freeing
> allocated "rd_info"s in the loop previously.

Of course, that works for this particular bug but I'm not a fan of that
approach...

When I say "do nothing" gotos, I mean.

err:
	return ret;

And what I mean by "one err" is this:

err:
	free(a);
	free(b)
	free(c);

	return ret;

There is only one error label even though we are freeing three things.
The problem with that is that you might be freeing something this hasn't
been allocated like "rd_info->skb_dma" but "rd_info" wasn't allocated.
It's a very normally problem to have with this style of error handling.

Most kernel error handling is very simple.

err_free_c:
	free(c);
err_free_b:
	free(b);
err_free_a:
	free(a);

	return ret;

Side note:  Part of the problem here is that device_alloc_rx_buf() does
not have a corresponding free function.  Every alloc should have a
matching free function so that if we ever change the alloc function, we
just have to update one free function.  And it's just cleaner.

static void device_free_rx_buf(struct vnt_private *priv,
			       struct vnt_rx_desc *rd)
{
	struct vnt_rd_info *rd_info = rd->rd_info;

	dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma, priv->rx_buf_sz,
			 DMA_FROM_DEVICE);
	dev_kfree_skb(rd_info->skb);
}

Maybe send a patch that adds that and changes device_free_rd0_ring() to
use the new free function instead of open coding it.  [PATCH 1/2].

These particular functions are slighttly complicated because they have
loops and the error handling for loops is tricky and bug prone.  Here is
what I would like the error handling to look like:

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 0dc902022a91..e12a959fe080 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -533,15 +533,23 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	int i;
 	dma_addr_t      curr = priv->rd0_pool_dma;
 	struct vnt_rx_desc *desc;
+	int ret;
 
 	/* Init the RD0 ring entries */
 	for (i = 0; i < priv->opts.rx_descs0;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD0Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
+		if (!desc->rd_info) {
+			ret = -ENOMEM;
+			goto err_free_descs;
+		}
 
-		if (!device_alloc_rx_buf(priv, desc))
+		if (!device_alloc_rx_buf(priv, desc)) {
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
+			ret = -ENOMEM;
+			goto err_free_rd;
+		}
 
 		desc->next = &(priv->aRD0Ring[(i + 1) % priv->opts.rx_descs0]);
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
@@ -550,6 +558,20 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
 	priv->pCurrRD[0] = &priv->aRD0Ring[0];
+
+	return 0;
+
+err_free_rd:
+	kfree(desc->rd_info);
+
+err_free_descs:
+	while (--i) {
+		desc = &priv->aRD0Ring[i];
+		device_free_rx_buf(priv, desc);
+		kfree(desc->rd_info);
+	}
+
+	return ret;
 }
 
 static void device_init_rd1_ring(struct vnt_private *priv)

It's more work to do it this way.  It's also more lines of code, but
it's easier to read and review because you can look at the function and
see that it's correct without jumping to other functions to verify that
they check if rd_info is NULL or not.

regards,
dan carpenter
