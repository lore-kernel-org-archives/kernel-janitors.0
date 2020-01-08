From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 15:24:18 +0000
Subject: Re: [PATCH] media: hantro: remove a pointless NULL check
Message-Id: <20200108152418.GH27042@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108053534.6rwxk2httwoflbgv@kili.mountain>
 <1118f946572b3da0562fa1c0347fceaeda93f38f.camel@collabora.com>
 <20200108151809.GG27042@kadam>
In-Reply-To: <20200108151809.GG27042@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org

On Wed, Jan 08, 2020 at 06:18:09PM +0300, Dan Carpenter wrote:
> On Wed, Jan 08, 2020 at 12:08:21PM -0300, Ezequiel Garcia wrote:
> > Hi Dan,
> > 
> > Thanks for the patch.
> > 
> > On Wed, 2020-01-08 at 08:35 +0300, Dan Carpenter wrote:
> > > This can't be NULL and we've already dereferenced it so let's remove
> > > the check.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > index 85af1b96fd34..0198bcda26b7 100644
> > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > @@ -688,7 +688,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
> > >  	return ret;
> > >  
> > >  err_codec_exit:
> > > -	if (ctx->codec_ops && ctx->codec_ops->exit)
> > > +	if (ctx->codec_ops->exit)
> > 
> > Since you are here, can you remove the other unneeded
> > checks in the driver?
> > 
> 
> There is only one more, but yes, I should remove it as well.

Actually the other check is required.

Let's just leave this one as well.  It doesn't hurt anything and it
makes the code more future proof.

regards,
dan carpenter
