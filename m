From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri, 01 Sep 2017 07:26:51 +0000
Subject: Re: [PATCH][next] phy: mvebu-cp110-comphy: fix -ve error return against a u32
Message-Id: <20170901072651.GB26758@kwain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+g7M9IMkV8truYOl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831164349.2826-1-colin.king@canonical.com>
In-Reply-To: <20170831164349.2826-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, "David S . Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Thu, Aug 31, 2017 at 05:43:49PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The check to see if the call to mvebu_comphy_get_mux failed is always
> false because mux is a u32 and can never be less than zero. Fix this
> by making mux an int and casting to u32 on shift later on.
>=20
> Detected by CoverityScan, CID#1455220 ("Unsigned compared against 0")
>=20
> Fixes: d0438bd6aa09 ("phy: add the mvebu cp110 comphy driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I actually have the very same fix in my local tree :) You sent it first
so,

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks!
Antoine

> ---
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/m=
arvell/phy-mvebu-cp110-comphy.c
> index 73ebad6634a7..7e21b2a977b9 100644
> --- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
> +++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
> @@ -468,8 +468,8 @@ static int mvebu_comphy_power_on(struct phy *phy)
>  {
>  	struct mvebu_comphy_lane *lane =3D phy_get_drvdata(phy);
>  	struct mvebu_comphy_priv *priv =3D lane->priv;
> -	int ret;
> -	u32 mux, val;
> +	int ret, mux;
> +	u32 val;
> =20
>  	mux =3D mvebu_comphy_get_mux(lane->id, lane->port, lane->mode);
>  	if (mux < 0)
> @@ -477,7 +477,7 @@ static int mvebu_comphy_power_on(struct phy *phy)
> =20
>  	regmap_read(priv->regmap, MVEBU_COMPHY_SELECTOR, &val);
>  	val &=3D ~(0xf << MVEBU_COMPHY_SELECTOR_PHY(lane->id));
> -	val |=3D mux << MVEBU_COMPHY_SELECTOR_PHY(lane->id);
> +	val |=3D (u32)mux << MVEBU_COMPHY_SELECTOR_PHY(lane->id);
>  	regmap_write(priv->regmap, MVEBU_COMPHY_SELECTOR, val);
> =20
>  	switch (lane->mode) {
> --=20
> 2.14.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM7Tg8N8kXOlT7hOhXE2LyK3bvNgFAlmpC7gACgkQXE2LyK3b
vNhlvA//f89FilY0SuaJ7g4gPwDBWIcJQcQpLKSOIZqJCRguCtD6SpyrF8rw/W+j
YljcufV8Qy6+w9Cpb1xPfaQcSjYj8Ea/zbvjvw2bIqQ7fRkqWYVzhNH1DM03O5lv
YMabiixdJ1CC6TrImrEx8+8K/DPKVslBq9hlEHMyCYpTrvEYRVr5qhCjDHrbVQhi
NuMI+JYFk7GngfFJzFTj7jj4kfj4kgoFbIHK6zMLpojHieUe8kALJryajYIGuODq
D/vVGSQp20iDL2SfLyUHgLAjXJrWfi312j/D74khce9rePIY2PyAr1dXuehKZckF
3KS1pjKwQ3zCy3nMI+sIfreiRe/cCZCcVWCyf/MCVCnffzQOAvBzaFoZDC8dn+Pq
on6r1c6I1BlZ3daLBDRasLHyyb/fq1ANglpaBlXRIT+wK8LU4FqNCkp5boGLWtW0
2qSOFwtjTm1yWNfOCzmGalvzCMzRtTifWDDvZrhUjnuX4vHuqCfN4Eaf1qjIb58A
QPCjAeUo1XNBUaSTOxztDLj7kKed2y/y1s4rKnJ1krTED9S9kFtPgfgY5tUhPA61
kHOD+boBOqZxTNDz1bET1i03yYrZLiTEJgN/OoZKNArytAe7T0gtwD5wUkzthRiS
DecruG+e7CspDRXxEe3sI5Q1OOjURryH7sD65fVgIDtS1mMQ5GU=
=K3UQ
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
