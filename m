From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Apr 2019 11:14:15 +0000
Subject: Re: [PATCH] media: omap_vout: potential buffer overflow in vidioc_dqbuf()
Message-Id: <20190410111415.GB31633@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409112924.GA13643@kadam>
 <eb4fe291-85b5-540b-c210-5e9fb051f2cc@xs4all.nl>
In-Reply-To: <eb4fe291-85b5-540b-c210-5e9fb051f2cc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Amber Jain <amber@ti.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Philipp Zabel <p.zabel@pengutronix.de>, Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>

On Wed, Apr 10, 2019 at 12:50:31PM +0200, Hans Verkuil wrote:
> On 4/9/19 1:29 PM, Dan Carpenter wrote:
> > diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
> > index 37f0d7146dfa..15e38990e85a 100644
> > --- a/drivers/media/platform/omap/omap_vout.c
> > +++ b/drivers/media/platform/omap/omap_vout.c
> > @@ -1527,8 +1527,6 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
> >  	unsigned long size;
> >  	struct videobuf_buffer *vb;
> >  
> > -	vb = q->bufs[b->index];
> > -
> >  	if (!vout->streaming)
> >  		return -EINVAL;
> >  
> > @@ -1539,6 +1537,8 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
> >  		/* Call videobuf_dqbuf for  blocking mode */
> >  		ret = videobuf_dqbuf(q, (struct v4l2_buffer *)b, 0);
> 
> We need a:
> 
> 	if (ret)
> 		return ret;
> 
> here. Or alternatively, add 'if (!ret)' around the next five lines.
> 
> b->index is only valid if the videobuf_dqbuf call returned 0.
> 

Doh.  Thanks.

regards,
dan carpenter
