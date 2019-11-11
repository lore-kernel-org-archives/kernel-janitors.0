From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 17:28:53 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake "exeuction" -> "execution"
Message-Id: <CADnq5_N+WdogHBKuQah92WS6ijFe8K6Ae3RxBdO5hyGMTMGsFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109194923.231655-1-colin.king@canonical.com>
 <633bbabf-56d4-ad4a-9d4e-9562e7122d17@amd.com>
In-Reply-To: <633bbabf-56d4-ad4a-9d4e-9562e7122d17-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas-5C7GfCeVMHo@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied.  Thanks!

Alex

On Mon, Nov 11, 2019 at 8:37 AM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2019-11-09 2:49 p.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There are spelling mistakes in a DC_ERROR message and a comment.
> > Fix these.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
> Thanks!
>
> Nicholas Kazlauskas
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c    | 2 +-
> >   drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> > index 61cefe0a3790..b65b66025267 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> > @@ -92,7 +92,7 @@ void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv)
> >
> >       status = dmub_srv_cmd_execute(dmub);
> >       if (status != DMUB_STATUS_OK)
> > -             DC_ERROR("Error starting DMUB exeuction: status=%d\n", status);
> > +             DC_ERROR("Error starting DMUB execution: status=%d\n", status);
> >   }
> >
> >   void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv)
> > diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
> > index aa8f0396616d..45e427d1952e 100644
> > --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
> > +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
> > @@ -416,7 +416,7 @@ enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
> >    * dmub_srv_cmd_execute() - Executes a queued sequence to the dmub
> >    * @dmub: the dmub service
> >    *
> > - * Begins exeuction of queued commands on the dmub.
> > + * Begins execution of queued commands on the dmub.
> >    *
> >    * Return:
> >    *   DMUB_STATUS_OK - success
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
