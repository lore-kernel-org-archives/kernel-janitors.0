From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 20 Jul 2016 17:29:33 +0000
Subject: Re: [PATCH] drm/atomic: Delete an unnecessary check before drm_property_unreference_blob()
Message-Id: <CAOw6vb+o++yMWomtq59b+ATFjgtg9J55xXS5L=h_1RA3sQGnFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <55998CD5.3080204@users.sourceforge.net>
 <CAEG8a3KgYtd4b6Dk0+TjcX_-gHXWMc5xv367LPvChivjM-uzRg@mail.gmail.com>
 <20150706065346.GA2156@phenom.ffwll.local>
 <563C8B3E.405@users.sourceforge.net>
 <20151116140425.GS16848@phenom.ffwll.local>
 <aa4cd508-38c3-78d7-a9f2-70e3b06a8fb5@users.sourceforge.net>
In-Reply-To: <aa4cd508-38c3-78d7-a9f2-70e3b06a8fb5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>

On Wed, Jul 20, 2016 at 12:02 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Jul 2016 17:54:32 +0200
>
> The drm_property_unreference_blob() function tests whether its argument
> is NULL and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/drm_atomic.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3cee084..8d2f111 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -404,8 +404,7 @@ drm_atomic_replace_property_blob(struct drm_property_blob **blob,
>         if (old_blob = new_blob)
>                 return;
>
> -       if (old_blob)
> -               drm_property_unreference_blob(old_blob);
> +       drm_property_unreference_blob(old_blob);
>         if (new_blob)
>                 drm_property_reference_blob(new_blob);


I wonder whether it'd be worthwhile to add the same check to
drm_property_reference_blob to make things symmetric.

Musings aside, I've applied this to drm-misc.

Sean


>         *blob = new_blob;
> --
> 2.9.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
