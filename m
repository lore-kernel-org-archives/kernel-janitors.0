From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 14:21:29 +0000
Subject: Re: [PATCH] drm/amd/display: clean up a condition in dmub_psr_copy_settings()
Message-Id: <CADnq5_O8CCdXR0LRfe5_Y_asydv0zDetWdYAteLt9=jw6DuVTg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113231.GD20562@mwanda>
In-Reply-To: <20200312113231.GD20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nathan Chancellor <natechancellor@gmail.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

On Thu, Mar 12, 2020 at 7:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We can remove the NULL check for "res_ctx" and
> "res_ctx->pipe_ctx[i].stream->link".  Also it's nicer to align the
> conditions using spaces so I re-indented a bit.
>
> Longer explanation: The "res_ctx" pointer points to an address in the
> middle of a struct so it can't be NULL.  For
> "res_ctx->pipe_ctx[i].stream->link" we know that it is equal to "link"
> and "link" is non-NULL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 9c88a92bd96a..bc109d4fc6e6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -134,11 +134,9 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
>         int i = 0;
>
>         for (i = 0; i < MAX_PIPES; i++) {
> -               if (res_ctx &&
> -                       res_ctx->pipe_ctx[i].stream &&
> -                       res_ctx->pipe_ctx[i].stream->link &&
> -                       res_ctx->pipe_ctx[i].stream->link = link &&
> -                       res_ctx->pipe_ctx[i].stream->link->connector_signal = SIGNAL_TYPE_EDP) {
> +               if (res_ctx->pipe_ctx[i].stream &&
> +                   res_ctx->pipe_ctx[i].stream->link = link &&
> +                   res_ctx->pipe_ctx[i].stream->link->connector_signal = SIGNAL_TYPE_EDP) {
>                         pipe_ctx = &res_ctx->pipe_ctx[i];
>                         break;
>                 }
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
