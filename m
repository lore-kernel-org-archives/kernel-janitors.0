From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Thu, 10 May 2012 08:01:18 +0000
Subject: Re: [patch] gma500: silence an unused variable warning
Message-Id: <20120510080118.GA29498@otc-wbsnb-06>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120510073302.GA5919@elgon.mountain>
In-Reply-To: <20120510073302.GA5919@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alan Cox <alan@linux.intel.com>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 10:33:02AM +0300, Dan Carpenter wrote:
> If CONFIG_BACKLIGHT_CLASS_DEVICE is disabled then GCC warns that:
> 	drivers/gpu/drm/gma500/opregion.c:154:6: warning:
> 		unused variable =E2=80=98max=E2=80=99 [-Wunused-variable]
>=20
> Which give me a chance to use the new config_enabled() macro.  :)

The first [direct] user of config_enabled()! :)

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/o=
pregion.c
> index 05661bf..d2125ba 100644
> --- a/drivers/gpu/drm/gma500/opregion.c
> +++ b/drivers/gpu/drm/gma500/opregion.c
> @@ -151,7 +151,6 @@ static u32 asle_set_backlight(struct drm_device *dev,=
 u32 bclp)
>  	struct drm_psb_private *dev_priv =3D dev->dev_private;
>  	struct opregion_asle *asle =3D dev_priv->opregion.asle;
>  	struct backlight_device *bd =3D dev_priv->backlight_device;
> -	u32 max;
> =20
>  	DRM_DEBUG_DRIVER("asle set backlight %x\n", bclp);
> =20
> @@ -165,11 +164,12 @@ static u32 asle_set_backlight(struct drm_device *de=
v, u32 bclp)
>  	if (bclp > 255)
>  		return ASLE_BACKLIGHT_FAILED;
> =20
> -#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> -	max =3D bd->props.max_brightness;
> -	bd->props.brightness =3D bclp * max / 255;
> -	backlight_update_status(bd);
> -#endif
> +	if (config_enabled(CONFIG_BACKLIGHT_CLASS_DEVICE)) {
> +		int max =3D bd->props.max_brightness;
> +		bd->props.brightness =3D bclp * max / 255;
> +		backlight_update_status(bd);
> +	}
> +
>  	asle->cblv =3D (bclp * 0x64) / 0xff | ASLE_CBLV_VALID;
> =20
>  	return 0;

--=20
 Kirill A. Shutemov

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPq3XNAAoJEAd+omnVudOMPkkQAIwCsBf3o1DkURsYFL4qiKge
nYvw2uucY6sIbkxEM7KeWAyeMp/0k3oVZdq1iOZR0THrPqvuaXe6eRN52u1qp3BA
latPFnw4FG6opUeCTENR2KirfjqmI/sIj3xzoLXIveOjV0E9NX0n7prC4lfZdyte
CkYlIQVFW41U+POLX9HuP3GKpiWxtqBclV/GvWoWCHDWEPTqhKzrqPrOs33hOs8x
2Ah60sQ3iS6237I/KUxW4fU9erv1sVRd4ZNOyWDVokIOLTT/zCCo/ZNCa+tizDt+
hYkRuGjlnibnY+n8CzCsYOOq3sjdLlE7UsfyI7HLBz58jZNEQZH+G67kgtIT38Xa
muQ8/vxoh7IQweD08NFnjksGtTbd8A3szMQVK8UX6cRYq/30bjnQoLoY4CfseY9b
t1/NeXx5oAghtJKxEfZxYu/011+O0uC1yqZagPzKdGJ6ct97ShWOHpjTw366+5t7
RcjjsVZ4srOAgoBDPoRj7oNFdtR4ZHbzhCSKPQ9XMStz3nHKok5RZ0Xe5KoC/blg
bOa+xtweSvum7Xaw3FTqYkz9oYjTVUz0eAXPMmhv9Xs2lpKsbg4LXWmU53T+FBdx
SzZEw5M8n7qmDvnyVRc93Cno20eB1iYxURGz6Q0agGPRXEhIiAr0xaB0tvtaJ3wu
ajmG41PHNlh0jDTw7b2Q
=jJe4
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
