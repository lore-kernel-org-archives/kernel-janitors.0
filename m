From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Wed, 10 Apr 2019 10:50:31 +0000
Subject: Re: [PATCH] media: omap_vout: potential buffer overflow in vidioc_dqbuf()
Message-Id: <eb4fe291-85b5-540b-c210-5e9fb051f2cc@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409112924.GA13643@kadam>
In-Reply-To: <20190409112924.GA13643@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Amber Jain <amber@ti.com>
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Philipp Zabel <p.zabel@pengutronix.de>, Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>

On 4/9/19 1:29 PM, Dan Carpenter wrote:
> The "b->index" is a u32 the comes from the user in the ioctl.  It hasn't
> been checked.  We aren't supposed to use it but we're instead supposed
> to use the value that gets written to it when we call videobuf_dqbuf().
> 
> The videobuf_dqbuf() first memsets it to zero and then re-initializes it
> inside the videobuf_status() function.  It's this final value which we
> want.
> 
> Fixes: 72915e851da9 ("[media] V4L2: OMAP: VOUT: dma map and unmap v4l2 buffers in qbuf and dqbuf")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> UNTESTED!  I think I understand this code now, but I have struggled to
> read it correctly in the past.  Please review carefully.
> 
> 
>  drivers/media/platform/omap/omap_vout.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
> index 37f0d7146dfa..15e38990e85a 100644
> --- a/drivers/media/platform/omap/omap_vout.c
> +++ b/drivers/media/platform/omap/omap_vout.c
> @@ -1527,8 +1527,6 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  	unsigned long size;
>  	struct videobuf_buffer *vb;
>  
> -	vb = q->bufs[b->index];
> -
>  	if (!vout->streaming)
>  		return -EINVAL;
>  
> @@ -1539,6 +1537,8 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  		/* Call videobuf_dqbuf for  blocking mode */
>  		ret = videobuf_dqbuf(q, (struct v4l2_buffer *)b, 0);

We need a:

	if (ret)
		return ret;

here. Or alternatively, add 'if (!ret)' around the next five lines.

b->index is only valid if the videobuf_dqbuf call returned 0.

Regards,

	Hans

>  
> +	vb = q->bufs[b->index];
> +
>  	addr = (unsigned long) vout->buf_phy_addr[vb->i];
>  	size = (unsigned long) vb->size;
>  	dma_unmap_single(vout->vid_dev->v4l2_dev.dev,  addr,
> 
