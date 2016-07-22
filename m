From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 22 Jul 2016 15:25:38 +0000
Subject: Re: [PATCH] drm/qxl: Delete an unnecessary check before drm_gem_object_unreference_unlocked()
Message-Id: <CAOw6vbLdgum=PFXv9A7e8sDb-4rLmof_QsYOENwpW37V_UOaCg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <913198fa-2aa4-4804-8616-dd495428c0a5@users.sourceforge.net>
In-Reply-To: <913198fa-2aa4-4804-8616-dd495428c0a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 22, 2016 at 8:22 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 22 Jul 2016 14:14:54 +0200
>
> The drm_gem_object_unreference_unlocked() function tests whether
> its argument is NULL and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to drm-misc

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index ad42968..3aef127 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -468,8 +468,7 @@ void qxl_user_framebuffer_destroy(struct drm_framebuffer *fb)
>  {
>         struct qxl_framebuffer *qxl_fb = to_qxl_framebuffer(fb);
>
> -       if (qxl_fb->obj)
> -               drm_gem_object_unreference_unlocked(qxl_fb->obj);
> +       drm_gem_object_unreference_unlocked(qxl_fb->obj);
>         drm_framebuffer_cleanup(fb);
>         kfree(qxl_fb);
>  }
> --
> 2.9.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
