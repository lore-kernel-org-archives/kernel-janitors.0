From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jan 2021 21:58:29 +0000
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake of function name
Message-Id: <CADnq5_Oypeyaq8YSHgPhouJcp7t8aSxT1Z0YxraWQV6aJm9uYQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210120092624.13061-1-colin.king@canonical.com>
 <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
In-Reply-To: <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Wed, Jan 20, 2021 at 9:46 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2021-01-20 4:26 a.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > There are two spelling mistakes of the function name, fix this
> > by using __func__ instead of a hard coded name string.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index c16af3983fdb..91d4130cd2cb 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -1602,7 +1602,7 @@ static bool dc_link_construct(struct dc_link *link,
> >
> >       link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
> >
> > -     DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
> > +     DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
> >       return true;
> >   device_tag_fail:
> >       link->link_enc->funcs->destroy(&link->link_enc);
> > @@ -1619,7 +1619,7 @@ static bool dc_link_construct(struct dc_link *link,
> >               link->hpd_gpio = NULL;
> >       }
> >
> > -     DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
> > +     DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
> >       kfree(info);
> >
> >       return false;
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
