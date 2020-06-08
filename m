From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 08 Jun 2020 20:16:46 +0000
Subject: Re: [PATCH] drm/amd/display: Fix indenting in dcn30_set_output_transfer_func()
Message-Id: <CADnq5_Mg2kJOmD40VyVNqbKnKU89QaNRLJ7dbre_pLDX2NuXog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200608141657.GB1912173@mwanda>
In-Reply-To: <20200608141657.GB1912173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Jun 8, 2020 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These lines are a part of the if statement and they are supposed to
> be indented one more tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index ab20320ebc994..37c310dbb3665 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
>                                         stream->out_transfer_func,
>                                         &mpc->blender_params, false))
>                                 params = &mpc->blender_params;
> -                /* there are no ROM LUTs in OUTGAM */
> -               if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> -                       BREAK_TO_DEBUGGER();
> +                        /* there are no ROM LUTs in OUTGAM */
> +                       if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> +                               BREAK_TO_DEBUGGER();
>                 }
>         }
>
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
