From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 May 2018 11:59:25 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180509115925.ajs2i727di7wqiee@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509081254.qxcetabxj74hltoq@mwanda>
 <152585393757.3513.738158010667924495@mail.alporthouse.com>
In-Reply-To: <152585393757.3513.738158010667924495@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, May 09, 2018 at 09:18:57AM +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2018-05-09 09:12:54)
> > There is a comment here which says that DIV_ROUND_UP() can overflow and
> > that's where the problem comes from.  Say you pick:
> > 
> >         args->bpp = UINT_MAX - 7;
> >         args->width = 4;
> >         args->height = 1;
> > 
> > The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> > because of how we picked args->width that means cpp < UINT_MAX / 4.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: correct a typo in the commit message
> > 
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> > index 39ac15ce4702..45b0b5bbb5f8 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -65,7 +65,8 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
> >                 return -EINVAL;
> >  
> >         /* overflow checks for 32bit size calculations */
> > -       /* NOTE: DIV_ROUND_UP() can overflow */
> > +       if (args->bpp > UINT_MAX - 8)
> > +               return -EINVAL;
> 
> #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d)
> 
> both args->bpp and cpp are u32, so should we use U32_MAX to be typesafe?
> 

They will always be equivalent so it's just a style issue...  I don't
have a strong preference so I can use U32_MAX if that's prefered.

> >         cpp = DIV_ROUND_UP(args->bpp, 8);
> >         if (!cpp || cpp > 0xffffffffU / args->width)
> 
> And these constants should also be U32_MAX?

Yeah.  I considered changing those but one never knows how much style to
clean up...  I'll redo in the respin.

regards,
dan carpenter

