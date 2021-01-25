From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 15:45:57 +0000
Subject: Re: [PATCH] drm/amd/display: Fix a potential NULL dereference
Message-Id: <CADnq5_MUs2fzVHTMo=zxtg8L7QaCvg0knJy=i2EuEj5r6uEuqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6FFK+F1XbGbYVJ@mwanda>
In-Reply-To: <YA6FFK+F1XbGbYVJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Anson Jacob <anson.jacob@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, David Airlie <airlied@linux.ie>, Wyatt Wood <wyatt.wood@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Leo Li <sunpeng.li@amd.com>, Jaehyun Chung <jaehyun.chung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>, George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Anthony Koo <Anthony.Koo@amd.com>

On Mon, Jan 25, 2021 at 3:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The debug printk dereferences "link->link_enc" before we have ensured
> that it is non-NULL.  Fix this potential NULL derefence by moving the
> printk after the check.
>
> Fixes: 1975b95ad4e7 ("drm/amd/display: Log link/connector info provided in BIOS object table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c16af3983fdb..4d31b2fae1f9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1525,13 +1525,13 @@ static bool dc_link_construct(struct dc_link *link,
>         link->link_enc >                 link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
>
> -       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> -
>         if (!link->link_enc) {
>                 DC_ERROR("Failed to create link encoder!\n");
>                 goto link_enc_create_fail;
>         }
>
> +       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> +
>         link->link_enc_hw_inst = link->link_enc->transmitter;
>
>         for (i = 0; i < 4; i++) {
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
