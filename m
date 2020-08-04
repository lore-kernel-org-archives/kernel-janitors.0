From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 04 Aug 2020 20:33:04 +0000
Subject: Re: [PATCH] drm/amd/display: Indent an if statement
Message-Id: <CADnq5_OCkSv5dgtxy2r1VApwTKXQe6oZapA+1VF2aj4Ux77-wQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200803143519.GB346925@mwanda>
In-Reply-To: <20200803143519.GB346925@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Charlene Liu <Charlene.Liu@amd.com>, Aric Cyr <aric.cyr@amd.com>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Mauro Rossi <issor.oruam@gmail.com>, kernel-janitors@vger.kernel.org, Samson Tam <Samson.Tam@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>, Reza Amini <Reza.Amini@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Mon, Aug 3, 2020 at 10:35 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The if statement wasn't indented so it's confusing.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index ca26714c800e..c6b737dd8425 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -71,7 +71,7 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
>                 if (ASIC_REV_IS_TAHITI_P(asic_id.hw_internal_rev) ||
>                     ASIC_REV_IS_PITCAIRN_PM(asic_id.hw_internal_rev) ||
>                     ASIC_REV_IS_CAPEVERDE_M(asic_id.hw_internal_rev))
> -               dc_version = DCE_VERSION_6_0;
> +                       dc_version = DCE_VERSION_6_0;
>                 else if (ASIC_REV_IS_OLAND_M(asic_id.hw_internal_rev))
>                         dc_version = DCE_VERSION_6_4;
>                 else
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
