From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 13 Nov 2018 11:09:10 +0000
Subject: Re: [PATCH -next] drm/sti: remove set but not used variable 'priv'
Message-Id: <CA+M3ks56PBoH3_H4a-DPKooGwx41T=K9XW5KhdRSTwRCYyOXGw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541818660-37168-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541818660-37168-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: yuehaibing@huawei.com
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>

Le sam. 10 nov. 2018 à 03:48, YueHaibing <yuehaibing@huawei.com> a écrit :
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/sti/sti_crtc.c: In function 'sti_crtc_vblank_cb':
> drivers/gpu/drm/sti/sti_crtc.c:255:22: warning:
>  variable 'priv' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in
>   9e1f05b28009 ("drm/sti: rename files and functions")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied on drm-misc-next.

Thanks,
Benjamin

> ---
>  drivers/gpu/drm/sti/sti_crtc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
> index 61c2379..ed76e52e 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.c
> +++ b/drivers/gpu/drm/sti/sti_crtc.c
> @@ -252,10 +252,8 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
>         struct sti_compositor *compo;
>         struct drm_crtc *crtc = data;
>         struct sti_mixer *mixer;
> -       struct sti_private *priv;
>         unsigned int pipe;
>
> -       priv = crtc->dev->dev_private;
>         pipe = drm_crtc_index(crtc);
>         compo = container_of(nb, struct sti_compositor, vtg_vblank_nb[pipe]);
>         mixer = compo->mixer[pipe];
>
>
>
