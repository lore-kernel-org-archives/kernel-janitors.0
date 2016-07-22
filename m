From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 22 Jul 2016 15:25:49 +0000
Subject: Re: [PATCH] drm/bridge: ps8622: Delete an unnecessary check before backlight_device_unregister()
Message-Id: <CAOw6vb+qOiJu4ikMmk8+j0eH+yzA81ynQfuc9FR4B4XKcRUh2w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <558EF095.8020106@users.sourceforge.net>
 <791089e4-201c-ad01-9c3b-f49835765177@users.sourceforge.net>
In-Reply-To: <791089e4-201c-ad01-9c3b-f49835765177@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Thierry Reding <treding@nvidia.com>

On Fri, Jul 22, 2016 at 8:54 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 22 Jul 2016 14:45:51 +0200
>
> The backlight_device_unregister() function tests whether its argument
> is NULL and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to drm-misc

> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index 5cd8dd7..583b8ce 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -636,9 +636,7 @@ static int ps8622_remove(struct i2c_client *client)
>  {
>         struct ps8622_bridge *ps8622 = i2c_get_clientdata(client);
>
> -       if (ps8622->bl)
> -               backlight_device_unregister(ps8622->bl);
> -
> +       backlight_device_unregister(ps8622->bl);
>         drm_bridge_remove(&ps8622->bridge);
>
>         return 0;
> --
> 2.9.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
