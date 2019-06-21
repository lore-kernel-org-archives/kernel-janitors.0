From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 21 Jun 2019 09:42:34 +0000
Subject: Re: [PATCH -next] drm/sti: Remove duplicated include from sti_drv.c
Message-Id: <CA+M3ks69T+Eh0Hd_OgCfT_VP=S_ouUwU+dawueJw9fzWO=LzmA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190620150306.124839-1-yuehaibing@huawei.com>
In-Reply-To: <20190620150306.124839-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le jeu. 20 juin 2019 à 16:56, YueHaibing <yuehaibing@huawei.com> a écrit :
>
> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied on drm-misc-next,
Thanks for the patch.

Benjamin

> ---
>  drivers/gpu/drm/sti/sti_drv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index bb6ae6dd66c9..2edd666fb44a 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -23,7 +23,6 @@
>
>  #include "sti_crtc.h"
>  #include "sti_drv.h"
> -#include "sti_drv.h"
>  #include "sti_plane.h"
>
>  #define DRIVER_NAME    "sti"
>
>
>
