From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 18 May 2017 12:28:55 +0000
Subject: Re: [PATCH] drm/sti:fix spelling mistake: "compoment" -> "component"
Message-Id: <CA+M3ks4Y28qYaTV5z9=V=+k+tqgFcaAZwE8L3UJzPf0-smdY1A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170513224150.19955-1-colin.king@canonical.com>
In-Reply-To: <20170513224150.19955-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-05-14 0:41 GMT+02:00 Colin King <colin.king@canonical.com>:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in DRM_ERROR message

Thanks for your patch, I merged it in drm-misc-next branch

Benjamin

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/sti/sti_compositor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
> index 11d4e885893a..6e4bf68262db 100644
> --- a/drivers/gpu/drm/sti/sti_compositor.c
> +++ b/drivers/gpu/drm/sti/sti_compositor.c
> @@ -129,7 +129,7 @@ static int sti_compositor_bind(struct device *dev,
>                         }
>                         break;
>                 default:
> -                       DRM_ERROR("Unknown subdev compoment type\n");
> +                       DRM_ERROR("Unknown subdev component type\n");
>                         return 1;
>                 }
>
> --
> 2.11.0
>
