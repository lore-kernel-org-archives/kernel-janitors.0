From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 21 Jan 2019 09:09:39 +0000
Subject: Re: [PATCH -next] drm/stm: ltdc: remove set but not used variable 'src_h'
Message-Id: <CA+M3ks6Q+hU9jjAbu6qkMqb0knALbBYonS0kRjyFQd_gcSgE=A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538131180-34108-1-git-send-email-yuehaibing@huawei.com>
 <1548059241-148022-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548059241-148022-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alexandre Torgue <alexandre.torgue@st.com>

Le lun. 21 janv. 2019 à 09:21, YueHaibing <yuehaibing@huawei.com> a écrit :
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/stm/ltdc.c: In function 'ltdc_plane_atomic_check':
> drivers/gpu/drm/stm/ltdc.c:694:13: warning:
>  variable 'src_y' set but not used [-Wunused-but-set-variable]
>   u32 src_x, src_y, src_w, src_h;
>              ^
>              ^
> drivers/gpu/drm/stm/ltdc.c:694:6: warning:
>  variable 'src_x' set but not used [-Wunused-but-set-variable]
>   u32 src_x, src_y, src_w, src_h;
>       ^
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied on drm-misc-next,

Thanks,
Benjamin

> ---
>  drivers/gpu/drm/stm/ltdc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 61dd661..a91e041 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -691,7 +691,7 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>                                    struct drm_plane_state *state)
>  {
>         struct drm_framebuffer *fb = state->fb;
> -       u32 src_x, src_y, src_w, src_h;
> +       u32 src_w, src_h;
>
>         DRM_DEBUG_DRIVER("\n");
>
> @@ -699,8 +699,6 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>                 return 0;
>
>         /* convert src_ from 16:16 format */
> -       src_x = state->src_x >> 16;
> -       src_y = state->src_y >> 16;
>         src_w = state->src_w >> 16;
>         src_h = state->src_h >> 16;
>
>
>
>
>
>
