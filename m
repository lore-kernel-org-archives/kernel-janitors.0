From: InKi Dae <daeinki@gmail.com>
Date: Mon, 14 May 2012 02:24:29 +0000
Subject: Re: [PATCH] drm/exynos: Include missing linux/types.h in header
Message-Id: <CAAQKjZNbu9E+bpt0cC8OiRhcGFe13E17bVU_ZY2EeLCzNpSavA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336661600-2409-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1336661600-2409-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Emil Goode <emilgoode@gmail.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

2012/5/10 Emil Goode <emilgoode@gmail.com>:
> Include the linux/types.h file where used types are declared.
>
> Sparse gives the following warning:
> /usr/include/drm/exynos_drm.h:92:
> =A0 =A0 =A0 =A0found __[us]{8,16,32,64} type without
> =A0 =A0 =A0 =A0#include <linux/types.h>
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> =A0include/drm/exynos_drm.h | =A0 =A02 ++
> =A01 file changed, 2 insertions(+)
>
> diff --git a/include/drm/exynos_drm.h b/include/drm/exynos_drm.h
> index e478de4..7eb7ae7 100644
> --- a/include/drm/exynos_drm.h
> +++ b/include/drm/exynos_drm.h
> @@ -29,6 +29,8 @@
> =A0#ifndef _EXYNOS_DRM_H_
> =A0#define _EXYNOS_DRM_H_
>
> +#include <linux/types.h>
> +

applied.

Thanks,
Inki Dae

> =A0/**
> =A0* User-desired buffer creation information structure.
> =A0*
> --
> 1.7.10
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
