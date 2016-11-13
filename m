From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 13 Nov 2016 15:09:31 +0000
Subject: Re: [PATCH] drm/sun4i: constify component_ops structures
Message-Id: <CAKMK7uGN_qSzPxfrYt_WsCYjxKSdZoQiM=UoSp7G=KXFWNe9Xw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1478971198-3659-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1478971198-3659-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Bhumika Goyal <bhumirks@gmail.com>

On Sat, Nov 12, 2016 at 6:19 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> These component_ops structures are only used as the second argument to
> component_add and component_del, which are declared as const, so the
> structures can be declared as const as well.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
>
> static struct component_ops i@p = { ... };
>
> @ok1@
> identifier r.i;
> expression e1;
> position p;
> @@
>
> component_add(e1,&i@p)
>
> @ok2@
> identifier r.i;
> expression e1;
> position p;
> @@
>
> component_del(e1, &i@p)
>
> @bad@
> position p != {r.p,ok1.p,ok2.p};
> identifier r.i;
> struct component_ops e;
> @@
>
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
>
> static
> +const
>  struct component_ops i = { ... };
> // </smpl>
>
> The result of the size command before the change is (arm):
>
>    text       data         bss     dec      hex filename
>    5266        236           8    5510     1586 sun4i_backend.o
>    6393        236           8    6637     19ed sun4i_tcon.o
>    3700        368           8    4076      fec sun4i_tv.o
>    1668        108           0    1776      6f0 sun6i_drc.o
>
> and after the change:
>
>    text       data         bss     dec     hex filename
>    5274        228           8    5510    1586 sun4i_backend.o
>    6401        228           8    6637    19ed sun4i_tcon.o
>    3708        360           8    4076     fec sun4i_tv.o
>    1676        100           0    1776     6f0 sun6i_drc.o
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to drm-misc, thanks.
-Daniel

>
> ---
>  drivers/gpu/drm/sun4i/sun4i_backend.c |    2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c    |    2 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c      |    2 +-
>  drivers/gpu/drm/sun4i/sun6i_drc.c     |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index 7eb2a96..2e08f96 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -409,7 +409,7 @@ static void sun4i_backend_unbind(struct device *dev, struct device *master,
>         reset_control_assert(backend->reset);
>  }
>
> -static struct component_ops sun4i_backend_ops = {
> +static const struct component_ops sun4i_backend_ops = {
>         .bind   = sun4i_backend_bind,
>         .unbind = sun4i_backend_unbind,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index c6afb24..ea2906f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -545,7 +545,7 @@ static void sun4i_tcon_unbind(struct device *dev, struct device *master,
>         sun4i_tcon_free_clocks(tcon);
>  }
>
> -static struct component_ops sun4i_tcon_ops = {
> +static const struct component_ops sun4i_tcon_ops = {
>         .bind   = sun4i_tcon_bind,
>         .unbind = sun4i_tcon_unbind,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 1dd3d9e..d430b331 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -667,7 +667,7 @@ static void sun4i_tv_unbind(struct device *dev, struct device *master,
>         clk_disable_unprepare(tv->clk);
>  }
>
> -static struct component_ops sun4i_tv_ops = {
> +static const struct component_ops sun4i_tv_ops = {
>         .bind   = sun4i_tv_bind,
>         .unbind = sun4i_tv_unbind,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
> index 6ef707c..09bba85 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -80,7 +80,7 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>         reset_control_assert(drc->reset);
>  }
>
> -static struct component_ops sun6i_drc_ops = {
> +static const struct component_ops sun6i_drc_ops = {
>         .bind   = sun6i_drc_bind,
>         .unbind = sun6i_drc_unbind,
>  };
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
