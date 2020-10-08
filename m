From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 08 Oct 2020 21:35:44 +0000
Subject: Re: [PATCH][next] power: supply: bq25980: remove redundant zero check on ret
Message-Id: <20201008213544.wakvf3ze2bshopem@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="fjlgoi4mnlire24r"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006170600.545361-1-colin.king@canonical.com>
 <4239fc37-c1d4-23e5-c784-b171eb6173ab@ti.com>
In-Reply-To: <4239fc37-c1d4-23e5-c784-b171eb6173ab@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Cc: Colin King <colin.king@canonical.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--fjlgoi4mnlire24r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 06, 2020 at 12:23:06PM -0500, Dan Murphy wrote:
> Colin
>=20
> On 10/6/20 12:06 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > Currently ret is assigned to zero and the following statement checks
> > if it is non-zero. This check is redundant and can be removed
> >=20
> > Addresses-Coverity: ("Logically dead code")
> > Fixes: 5069185fc18e ("power: supply: bq25980: Add support for the BQ259=
xx family")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/power/supply/bq25980_charger.c | 3 ---
> >   1 file changed, 3 deletions(-)
> >=20
> > diff --git a/drivers/power/supply/bq25980_charger.c b/drivers/power/sup=
ply/bq25980_charger.c
> > index 3995fb7cf060..f04f9acdb13b 100644
> > --- a/drivers/power/supply/bq25980_charger.c
> > +++ b/drivers/power/supply/bq25980_charger.c
> > @@ -613,9 +613,6 @@ static int bq25980_set_battery_property(struct powe=
r_supply *psy,
> >   	struct bq25980_device *bq =3D power_supply_get_drvdata(psy);
> >   	int ret =3D 0;
> > -	if (ret)
> > -		return ret;
> > -
> >   	switch (psp) {
> >   	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> >   		ret =3D bq25980_set_const_charge_curr(bq, val->intval);
>=20
> Thanks for the patch
>=20
> Acked-by: Dan Murphy <dmurphy@ti.com>

Thanks, queued.

-- Sebastian

--fjlgoi4mnlire24r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9/hiwACgkQ2O7X88g7
+poEdQ/+M18AeoweOM86uVV6sfWR67UYgB1+C4wBV55tCIj4NMSQ8gGdZo3plK1h
K6ZPaUS/dbpreixvpi8F5bumnAqIYeCepykZs6FFrLbRcZViZhjFvayM7xqBTQr2
I6nc3RhAsno+h8niIiWRDFANT545Bohao6ImXer6+UtkyYyo2QdbGWXABTP7SqhW
CD0ZwoUvhWAoR1Vq/gJ5XXJiVQYvH5iCKB+HRzGI9UWCSFbcGJv4DgikxrIxEfEH
5Yv8LIWBjhW1OnKbmCwT9g0/RT2+XVioWua6EggF7dK11JjpQmF1wyDnZ4LkIyWP
ZaZoBDnO7iU/Sk6DgsXhYCdrmS940MWxUe0INpYEp3K27vIUAUgj5c635pOWvDrI
fCk74FHbs49N9ESHD+NTEy59lblVuYRUFoK21GgGzgO9ual7CENc4rOXWnJpXhlo
VyNl4C4Jvl3olYbVlTZPszZxYOGkzJbjriKnbH95EOzdbMn4gQmrw49uslu1tTk/
j4e52Enu797dKSUbvZc1uoh2ruPkksvAbsiB5CHuCkyaCB2bVEX6QCQ9fWvFGEc1
ony2kQcljVyg5kLOS9qEf3FCVrijCU1Ui2kGVAIcPscr1zBonZ+ReQknqKVkHfgF
tiqzxEe6uam8/INZsnHHcKRmplPDLp5/Y4vsFW0jLpjyAomtd/w=
=hZwC
-----END PGP SIGNATURE-----

--fjlgoi4mnlire24r--
