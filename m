From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 15 Jan 2021 14:32:55 +0000
Subject: Re: [PATCH][next] power: supply: cpcap-charger: Fix power_supply_put on null battery pointer
Message-Id: <20210115143255.ornoji7wr232topr@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="u7krr22x5oqasrjc"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210115131524.71339-1-colin.king@canonical.com>
 <YAGXgWeWvy/0FyqN@atomide.com>
In-Reply-To: <YAGXgWeWvy/0FyqN@atomide.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Colin King <colin.king@canonical.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--u7krr22x5oqasrjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 15, 2021 at 03:24:17PM +0200, Tony Lindgren wrote:
> * Colin King <colin.king@canonical.com> [210115 13:15]:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > Currently if the pointer battery is null there is a null pointer
> > dereference on the call to power_supply_put.  Fix this by only
> > performing the put if battery is not null.
> >=20
> > Addresses-Coverity: ("Dereference after null check")
> > Fixes: 4bff91bb3231 ("power: supply: cpcap-charger: Fix missing power_s=
upply_put()")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>=20
> Oopsie, thanks for fixing it:
>=20
> Acked-by: Tony Lindgren <tony@atomide.com>

Thanks, queued.

-- Sebastian

> >  drivers/power/supply/cpcap-charger.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/suppl=
y/cpcap-charger.c
> > index 823d666f09e0..641dcad1133f 100644
> > --- a/drivers/power/supply/cpcap-charger.c
> > +++ b/drivers/power/supply/cpcap-charger.c
> > @@ -300,8 +300,9 @@ cpcap_charger_get_bat_const_charge_voltage(struct c=
pcap_charger_ddata *ddata)
> >  				&prop);
> >  		if (!error)
> >  			voltage =3D prop.intval;
> > +
> > +		power_supply_put(battery);
> >  	}
> > -	power_supply_put(battery);
> > =20
> >  	return voltage;
> >  }
> > --=20
> > 2.29.2
> >=20

--u7krr22x5oqasrjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmABp48ACgkQ2O7X88g7
+po0jxAAh7jfrbid8B+lxearz9t9C+okKFY4PfYtDMOOzoomxqzZ0NSjbRTsScrU
HBDqwOkt25UmllTEIBm6fn+LYn4ND8O2Ur2GyuLMjVB4a1j6qs76Ha3sA3o2E6Zk
z7VNlkGyejQFgsBOUGekvdlr+LSxSelj8vtY8VbeQczHt5SFQ5eqx2YSDgzpX15W
aL3h3Xlq2SodQtb6QJ833y1p1XsxjrJAxBGATI/Ry1LWRdNCkq4VtQNP49n2JGzL
2fV2GJ03tKYDrRq2E9Pbm4b7p6nALi3QwpYNJoqdSU4cHcIX4oq4p6in1/JOU2hL
TnUIPXXLO1uUQr5/HpbOyUbPfhFW3hzKecr+KmGKjjG52vga4Ws1OQUPRKnA3kwe
GEEqDNCpDF7Eo4Z5UfQybVBIJyr72bffvjtd6gQgkPpYCdR9hmXumZFBkMYifJBC
dGNaOQzQSztTLGTpiEhIDufpPvDNnQvpWQ6Qz4mdCldmyygC8CHogptacuZPKaV7
qMwiN3vwtAw9vpMRIx7gYXZfS4+IeNrMh98xO2Ks8GyH1EX/uMFB+rPjiifMyy4N
25LZdChqJe+cDDiZ7UW6euABvOd+AbP5DBKHSLoxXDQ2QIgFR58TtCR8YurVOUrM
rzpmqDr9AhzCB7S/3v80ouzcayieGIxMEP81GWRdIpuFzGd1yOg=
=nwqI
-----END PGP SIGNATURE-----

--u7krr22x5oqasrjc--
