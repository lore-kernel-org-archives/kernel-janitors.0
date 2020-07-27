From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2020 18:11:58 +0000
Subject: Re: [PATCH 2/2] drm/radeon: avoid a useless memset
Message-Id: <CADnq5_OqdUxSKv21pg9o=a_dwyW7-j3URy+BYHrS+ubzuA-7NQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
 <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
In-Reply-To: <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christian Koenig <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>

Applied.  Thanks!

Alex

On Mon, Jul 27, 2020 at 9:41 AM Christian König
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 27.07.20 um 12:34 schrieb Christophe JAILLET:
> > Avoid a memset after a call to 'dma_alloc_coherent()'.
> > This is useless since
> > commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_gart.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
> > index b7ce254e5663..3808a753127b 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gart.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> > @@ -85,7 +85,6 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
> >       }
> >   #endif
> >       rdev->gart.ptr = ptr;
> > -     memset((void *)rdev->gart.ptr, 0, rdev->gart.table_size);
> >       return 0;
> >   }
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
