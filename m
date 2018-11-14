From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 14 Nov 2018 14:49:30 +0000
Subject: Re: [PATCH -next] drm/sun4i: hdmi: Use PTR_ERR_OR_ZERO in sun4i_tmds_create()
Message-Id: <20181114144930.j26xlro2cke47xza@flea>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bxddqxz2i5jewhca"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541558063-100341-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541558063-100341-1-git-send-email-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--bxddqxz2i5jewhca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Nov 07, 2018 at 02:34:23AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/dr=
m/sun4i/sun4i_hdmi_tmds_clk.c
> index fb985ba..3d5ee6f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> @@ -232,8 +232,5 @@ int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
>  	tmds->div_offset =3D hdmi->variant->tmds_clk_div_offset;
> =20
>  	hdmi->tmds_clk =3D devm_clk_register(hdmi->dev, &tmds->hw);
> -	if (IS_ERR(hdmi->tmds_clk))
> -		return PTR_ERR(hdmi->tmds_clk);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hdmi->tmds_clk);

While this is technically correct (and I appreciate that this is also
a matter of taste), I find the former syntax to be clearer and easier
to extend if needed.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bxddqxz2i5jewhca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+w1+gAKCRDj7w1vZxhR
xRpRAP9rYgWArEpgq7P/wY8Lmo+yxM4RN2CRLzR5vqDQNU+suQD7BRiMKWmV87dD
b0/KX4wnPXW142jqRW1ztlvBcuRYHgo=
=D1nG
-----END PGP SIGNATURE-----

--bxddqxz2i5jewhca--
