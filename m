From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jan 2017 14:26:50 +0000
Subject: Re: [PATCH] drm/amd/powerplay: header should be defining _SMU7_CLOCK_POWER_GATING_H_
Message-Id: <CADnq5_OGEHWv63poYszvz+BryRbtQpmh1iivRYMODpktbhWcVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170125120732.25126-1-colin.king@canonical.com>
In-Reply-To: <20170125120732.25126-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Jan 25, 2017 at 7:07 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> _SMU7_CLOCK_POWER_GATING_H_ is being used as a header guard, followed by
> a #define of a different macro.  Define _SMU7_CLOCK_POWER_GATING_H_ instead
> to fix this.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch.  Nicolas beat you to it:
https://lists.freedesktop.org/archives/dri-devel/2017-January/130477.html


Alex

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
> index d52a28c..c96ed9e 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
> @@ -22,7 +22,7 @@
>   */
>
>  #ifndef _SMU7_CLOCK_POWER_GATING_H_
> -#define _SMU7_CLOCK__POWER_GATING_H_
> +#define _SMU7_CLOCK_POWER_GATING_H_
>
>  #include "smu7_hwmgr.h"
>  #include "pp_asicblocks.h"
> --
> 2.10.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
