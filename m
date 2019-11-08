From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 08 Nov 2019 16:34:45 +0000
Subject: Re: [PATCH][next] drm/amd/display: remove redundant variable status
Message-Id: <CADnq5_NC1znSqvSUDkABAkb9VwAF9F1qdZ+JdRQZLMwoptjsDg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191108162945.180624-1-colin.king@canonical.com>
In-Reply-To: <20191108162945.180624-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, Nov 8, 2019 at 11:29 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable status is redundant, it is being initialized with a value
> that is over-written later and this is being returned immediately
> after the assignment.  Clean up the code by removing status and
> just returning the value returned from the call to function
> dc->hwss.dmdata_status_done.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 371d49e9b745..88a84bfaea6f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -565,7 +565,6 @@ bool dc_stream_get_scanoutpos(const struct dc_stream_state *stream,
>
>  bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream)
>  {
> -       bool status = true;
>         struct pipe_ctx *pipe = NULL;
>         int i;
>
> @@ -581,8 +580,7 @@ bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream)
>         if (i = MAX_PIPES)
>                 return true;
>
> -       status = dc->hwss.dmdata_status_done(pipe);
> -       return status;
> +       return dc->hwss.dmdata_status_done(pipe);
>  }
>
>  bool dc_stream_set_dynamic_metadata(struct dc *dc,
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
