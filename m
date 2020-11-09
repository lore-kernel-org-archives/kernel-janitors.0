From: Kurt Kanzenbach <kurt@linutronix.de>
Date: Mon, 09 Nov 2020 12:51:45 +0000
Subject: Re: [PATCH][next] net: dsa: fix unintended sign extension on a u16 left shift
Message-Id: <877dqusnfi.fsf@kurt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109124008.2079873-1-colin.king@canonical.com>
In-Reply-To: <20201109124008.2079873-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon Nov 09 2020, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of u16 variable high is promoted to the type int and
> then sign extended to a 64 bit u64 value.  If the top bit of high is
> set then the upper 32 bits of the result end up being set by the
> sign extension. Fix this by explicitly casting the value in high to
> a u64 before left shifting by 16 places.
>
> Also, remove the initialisation of variable value to 0 at the start
> of each loop iteration as the value is never read and hence the
> assignment it is redundant.
>
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek s=
witches")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/dsa/hirschmann/hellcreek.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hir=
schmann/hellcreek.c
> index dfa66f7260d6..d42f40c76ba5 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> @@ -308,7 +308,7 @@ static void hellcreek_get_ethtool_stats(struct dsa_sw=
itch *ds, int port,
>  		const struct hellcreek_counter *counter =3D &hellcreek_counter[i];
>  		u8 offset =3D counter->offset + port * 64;
>  		u16 high, low;
> -		u64 value =3D 0;
> +		u64 value;
>=20=20
>  		mutex_lock(&hellcreek->reg_lock);
>=20=20
> @@ -320,7 +320,7 @@ static void hellcreek_get_ethtool_stats(struct dsa_sw=
itch *ds, int port,
>  		 */
>  		high  =3D hellcreek_read(hellcreek, HR_CRDH);
>  		low   =3D hellcreek_read(hellcreek, HR_CRDL);
> -		value =3D (high << 16) | low;
> +		value =3D ((u64)high << 16) | low;

Looks good to me. Thank you.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAl+pO2EACgkQeSpbgcuY
8KauRhAAkLQ+DCT570ooD5dZAQdphqu8IuvFMDQbsPy92qO9FNA07A5n0P2hbZdq
JE2jjD0VUcP+FjhbZ7nz7vPl9vohLZ4P5ZQBX+J25YF+lh0JqJFcH8kSdhobOSdb
Cz68+RnbmEA63M82oYGZUwk7ZZ48Ao4oa6v+9snaUZ4onq2iy1ZBcvqpjbTtMCKn
CQxH8fGe8D6l0vXUF6Ma/M/RTuOFA7IK7rVVBJ2OyAxzrSj/Q6sJ0RrUsgHztBms
iWRWu2Vdq434aR73SxKj8O8pWRusagd0xdNcMu8Le1Zd9dw6CE+MGBGWZiqCyzeY
mZF2A6GW4OMKFz6GLhIlSU/MclXMLmYNRKh0AiaccG9A2M8C6R+5sL62BeJU6WPm
jEv0DM5fV3dPEA2w7U2bS2CTJVtpwgFutE2q8CsIKpZ1gyRDkSvoGBH5Mjy+l2qA
NIi0c9gBCgz6Mx2uyXme6hmciTFd6cCohmjFm7gtX8ZbumqIFhaWNNwFrgFZ/FsB
LoxBRM7hZPkGmnnMFrxKpTym+9JcAg5+gvFsa2G6gfAv22fxdi/qKg34npksnWY+
GvOFLwHBJJrenP96uDCNOlogRkOesgdeO9K6R3JqpgEFV0l0kV2q5mZ3bPxT/cIw
jw4M68MPiFOfiUudIARjVofFONh/Dn0bpekmSA8HWLTu5Dvj8zY=
=DIYK
-----END PGP SIGNATURE-----
--=-=-=--
