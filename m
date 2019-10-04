From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 04 Oct 2019 16:04:45 +0000
Subject: Re: [PATCH] drm/i810: Prevent underflow in ioctl
Message-Id: <157020508581.18712.9108329337994387428@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004102251.GC823@mwanda>
 <157019813720.18712.6286079822254824652@skylake-alporthouse-com>
In-Reply-To: <157019813720.18712.6286079822254824652@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>

Quoting Chris Wilson (2019-10-04 15:08:57)
> Quoting Dan Carpenter (2019-10-04 11:22:51)
> > The "used" variables here come from the user in the ioctl and it can be
> > negative.  It could result in an out of bounds write.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/i810/i810_dma.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
> > index 2a77823b8e9a..e66c38332df4 100644
> > --- a/drivers/gpu/drm/i810/i810_dma.c
> > +++ b/drivers/gpu/drm/i810/i810_dma.c
> > @@ -728,7 +728,7 @@ static void i810_dma_dispatch_vertex(struct drm_device *dev,
> >         if (nbox > I810_NR_SAREA_CLIPRECTS)
> >                 nbox = I810_NR_SAREA_CLIPRECTS;
> >  
> > -       if (used > 4 * 1024)
> > +       if (used < 0 || used > 4 * 1024)
> >                 used = 0;
> 
> Yes, as passed to the GPU instruction, negative used is invalid.
> 
> Then it is used as an offset into a memblock, where a negative offset
> would be very bad.
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Applied to drm-misc-next with cc'ed stable.
-Chris
