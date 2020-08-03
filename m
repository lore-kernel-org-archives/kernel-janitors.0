From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 03 Aug 2020 06:46:45 +0000
Subject: Re: [PATCH][next] drm/rockchip: lvds: ensure ret is assigned before checking for an error
Message-Id: <20200803084645.442b5178@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714190003.744069-1-colin.king@canonical.com>
In-Reply-To: <20200714190003.744069-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hello,

Colin King <colin.king@canonical.com> wrote on Tue, 14 Jul 2020
20:00:03 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently there are two places where the return status in ret is being
> checked for an error however the assignment of ret has been omitted
> making the checks redundant.  Fix this by adding in the missing assignmen=
ts
> of ret.
>=20
> Addresses-Coverity: ("Logically dead code")
> Fixes: cca1705c3d89 ("drm/rockchip: lvds: Add PX30 support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index 63f967902c2d..b45c618b9793 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -499,11 +499,11 @@ static int px30_lvds_probe(struct platform_device *=
pdev,
>  	if (IS_ERR(lvds->dphy))
>  		return PTR_ERR(lvds->dphy);
> =20
> -	phy_init(lvds->dphy);
> +	ret =3D phy_init(lvds->dphy);
>  	if (ret)
>  		return ret;
> =20
> -	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
> +	ret =3D phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
>  	if (ret)
>  		return ret;
> =20

I thought I (or Heiko) already sent a patch for that but apparently
not...

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
