From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 19 Dec 2019 14:39:04 +0000
Subject: Re: [PATCH][next] drm/gma500: fix null dereference of pointer fb before null check
Message-Id: <CAMeQTsYmqJwYrAM1bGu2VyVop3sSFcp2fOMrxD4OvhH13jad9Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191216162136.270114-1-colin.king@canonical.com>
In-Reply-To: <20191216162136.270114-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>

On Mon, Dec 16, 2019 at 5:21 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer fb is being dereferenced when assigning dev before it
> is null checked.  Fix this by only dereferencing dev after the
> null check.

Applied to drm-misc-next

Thanks
Patrik

>
> Fixes: 6b7ce2c4161a ("drm/gma500: Remove struct psb_fbdev")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/gma500/accel_2d.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
> index b9e5a38632f7..adc0507545bf 100644
> --- a/drivers/gpu/drm/gma500/accel_2d.c
> +++ b/drivers/gpu/drm/gma500/accel_2d.c
> @@ -228,8 +228,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
>  {
>         struct drm_fb_helper *fb_helper = info->par;
>         struct drm_framebuffer *fb = fb_helper->fb;
> -       struct drm_device *dev = fb->dev;
> -       struct drm_psb_private *dev_priv = dev->dev_private;
> +       struct drm_device *dev;
> +       struct drm_psb_private *dev_priv;
>         uint32_t offset;
>         uint32_t stride;
>         uint32_t src_format;
> @@ -238,6 +238,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
>         if (!fb)
>                 return;
>
> +       dev = fb->dev;
> +       dev_priv = dev->dev_private;
>         offset = to_gtt_range(fb->obj[0])->offset;
>         stride = fb->pitches[0];
>
> --
> 2.24.0
>
