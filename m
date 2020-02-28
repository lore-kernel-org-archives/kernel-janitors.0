From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Feb 2020 22:23:17 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix indentation issue on a hunk of code
Message-Id: <CADnq5_M17_MMfy8YqK-wn_aew1ZG2zZtsj7kaK5eM3=Em2zzzA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228131606.65041-1-colin.king@canonical.com>
In-Reply-To: <20200228131606.65041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Feb 28, 2020 at 8:16 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are multiple statements that are indented incorrectly. Add
> in the missing tabs.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> index 5d081c42e81b..2c6db379afae 100644
> --- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> @@ -3265,33 +3265,33 @@ bool bw_calcs(struct dc_context *ctx,
>                                 bw_fixed_to_int(bw_mul(data->
>                                         stutter_exit_watermark[9], bw_int_to_fixed(1000)));
>
> -               calcs_output->stutter_entry_wm_ns[0].b_mark > -                       bw_fixed_to_int(bw_mul(data->
> -                               stutter_entry_watermark[4], bw_int_to_fixed(1000)));
> -               calcs_output->stutter_entry_wm_ns[1].b_mark > -                       bw_fixed_to_int(bw_mul(data->
> -                               stutter_entry_watermark[5], bw_int_to_fixed(1000)));
> -               calcs_output->stutter_entry_wm_ns[2].b_mark > -                       bw_fixed_to_int(bw_mul(data->
> -                               stutter_entry_watermark[6], bw_int_to_fixed(1000)));
> -               if (ctx->dc->caps.max_slave_planes) {
> -                       calcs_output->stutter_entry_wm_ns[3].b_mark > +                       calcs_output->stutter_entry_wm_ns[0].b_mark >                                 bw_fixed_to_int(bw_mul(data->
> -                                       stutter_entry_watermark[0], bw_int_to_fixed(1000)));
> -                       calcs_output->stutter_entry_wm_ns[4].b_mark > +                                       stutter_entry_watermark[4], bw_int_to_fixed(1000)));
> +                       calcs_output->stutter_entry_wm_ns[1].b_mark >                                 bw_fixed_to_int(bw_mul(data->
> -                                       stutter_entry_watermark[1], bw_int_to_fixed(1000)));
> -               } else {
> -                       calcs_output->stutter_entry_wm_ns[3].b_mark > +                                       stutter_entry_watermark[5], bw_int_to_fixed(1000)));
> +                       calcs_output->stutter_entry_wm_ns[2].b_mark >                                 bw_fixed_to_int(bw_mul(data->
> -                                       stutter_entry_watermark[7], bw_int_to_fixed(1000)));
> -                       calcs_output->stutter_entry_wm_ns[4].b_mark > +                                       stutter_entry_watermark[6], bw_int_to_fixed(1000)));
> +                       if (ctx->dc->caps.max_slave_planes) {
> +                               calcs_output->stutter_entry_wm_ns[3].b_mark > +                                       bw_fixed_to_int(bw_mul(data->
> +                                               stutter_entry_watermark[0], bw_int_to_fixed(1000)));
> +                               calcs_output->stutter_entry_wm_ns[4].b_mark > +                                       bw_fixed_to_int(bw_mul(data->
> +                                               stutter_entry_watermark[1], bw_int_to_fixed(1000)));
> +                       } else {
> +                               calcs_output->stutter_entry_wm_ns[3].b_mark > +                                       bw_fixed_to_int(bw_mul(data->
> +                                               stutter_entry_watermark[7], bw_int_to_fixed(1000)));
> +                               calcs_output->stutter_entry_wm_ns[4].b_mark > +                                       bw_fixed_to_int(bw_mul(data->
> +                                               stutter_entry_watermark[8], bw_int_to_fixed(1000)));
> +                       }
> +                       calcs_output->stutter_entry_wm_ns[5].b_mark >                                 bw_fixed_to_int(bw_mul(data->
> -                                       stutter_entry_watermark[8], bw_int_to_fixed(1000)));
> -               }
> -               calcs_output->stutter_entry_wm_ns[5].b_mark > -                       bw_fixed_to_int(bw_mul(data->
> -                               stutter_entry_watermark[9], bw_int_to_fixed(1000)));
> +                                       stutter_entry_watermark[9], bw_int_to_fixed(1000)));
>
>                         calcs_output->urgent_wm_ns[0].b_mark >                                 bw_fixed_to_int(bw_mul(data->
> --
> 2.25.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
