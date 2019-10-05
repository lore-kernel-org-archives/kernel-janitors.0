From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 15:02:58 +0000
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
Message-Id: <027fde47-86b3-35c8-85e6-ea7c191e772c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004190938.15353-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de
Cc: kernel-janitors@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen McCamant <smccaman@umn.edu>, Fabio Estevam <festevam@gmail.com>

> In imx_pd_bind, the duplicated memory for imxpd->edid via kmemdup should
> be released in drm_of_find_panel_or_bridge or imx_pd_register fail.

Please improve this change description.


> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -227,14 +227,18 @@ static int imx_pd_bind(struct device *dev, struct d=
evice *master, void *data)
>
>  	/* port@1 is the output port */
>  	ret =3D drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel, &imxpd->br=
idge);
> -	if (ret && ret !=3D -ENODEV)
> +	if (ret && ret !=3D -ENODEV) {
> +		kfree(imxpd->edid);
>  		return ret;
> +	}
>
>  	imxpd->dev =3D dev;

Please use a jump target here instead of adding duplicate source code
for the completion of exception handling.

 	if (ret && ret !=3D -ENODEV)
-		return ret;
+		goto free_edid;

=E2=80=A6

+free_edid:
+ 	kfree(imxpd->edid);
+ 	return ret;


Regards,
Markus
