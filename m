From: Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 22 May 2019 13:37:09 +0000
Subject: Re: [PATCH] mmc: tegra: Fix a warning message
Message-Id: <20190522133709.GP30938@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="fjEAjMKpll6GDq3U"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190515093512.GD3409@mwanda>
In-Reply-To: <20190515093512.GD3409@mwanda>
To: kernel-janitors@vger.kernel.org


--fjEAjMKpll6GDq3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 01:46:40PM +0200, Ulf Hansson wrote:
> On Wed, 15 May 2019 at 11:35, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
> >
> > The WARN_ON() macro takes a condition, not a warning message.  I've
> > changed this to use WARN(1, "msg...
> >
> > Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/mmc/host/sdhci-tegra.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-te=
gra.c
> > index f608417ae967..10d7aaf68bab 100644
> > --- a/drivers/mmc/host/sdhci-tegra.c
> > +++ b/drivers/mmc/host/sdhci-tegra.c
> > @@ -865,7 +865,7 @@ static void tegra_sdhci_tap_correction(struct sdhci=
_host *host, u8 thd_up,
> >         }
> >
> >         if (!first_fail) {
> > -               WARN_ON("no edge detected, continue with hw tuned delay=
=2E\n");
> > +               WARN(1, "no edge detected, continue with hw tuned delay=
=2E\n");
>=20
> Not sure why this is a WARN*() in the first place.
>=20
> Seems like a dev_warn() or possibly a dev_warn_once() should be used inst=
ead.

I think this was on purpose in order to increase the likelihood of this
getting reported. Sowjanya knows the details much better, but I think
this is supposed to be very rare and really a problem with the tap
settings in device tree, which is something that we want to know and
fix.

Let's see if Sowjanya can shed some light on this.

Thierry

>=20
> >         } else if (first_pass) {
> >                 /* set tap location at fixed tap relative to the first =
edge */
> >                 edge1 =3D first_fail_tap + (first_pass_tap - first_fail=
_tap) / 2;
> > --
> > 2.20.1
> >
>=20
> Kind regards
> Uffe

--fjEAjMKpll6GDq3U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlUIUACgkQ3SOs138+
s6F0QBAAksTLDfO6VjZcZqb180eRJWMpz5Zg5LuPq79lhM3L/YixfAft1l9u9EYt
aej5HRvxbsp0ZrpwO6FFjHZr10rw3WXPY/Z4p4SlavggxlQ0kq47XQoanSEs9gfC
A3Ev5r7M7dsOMc4vd/N7f+DC5CHjJPRkAmi7njT/dg0fH2h97W0NW8B9N4KQZTqW
+Wtsl3HK2Vjv32Tx9X0fZ0GfWqjx47dSfpk4jb6LkhAM2LSK/ip5fg9WT5ozXglR
vftiC+qx3Jjteq2+jZHfTNNeimNfhmlAcSketbeT2eCMWhV/oSuAKJgsy7NOUymK
LowtGaMghq20BdtFLgL74xLfsv+o82EKC5+6PBciordFByXvke/oCxhxvFjiUFgM
REc9bprAT7xyX21txizEXvLu7s6RLpu9U3tHQG6l4vGm2I34w+uSjTt3D40qc36u
hoJhdWiIaiSPrCTUd3kbUxZu3RVL99Q+XMYivWp+n1p2H/NjVnB9CCUrRO1XD7CR
4u/54xfY7PlwoYtLdwlwreBFKqZIM3OV4oePV0L5C7yJOPd3x/o2nrKAXbiIDzO0
Z+YxyTKsL4s8FuUxD87yeLtOPGrLrJUoDPzfH3VfCsHPNGB1fyvOt5FVkpu4D4eq
Y2eTDAVS3Nfd0Lt1aTGIkSMA8mv9IRwW3xHXV+vzFNJs2huUc64=
=moWN
-----END PGP SIGNATURE-----

--fjEAjMKpll6GDq3U--
