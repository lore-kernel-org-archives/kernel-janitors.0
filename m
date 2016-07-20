From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:53:33 +0000
Subject: Re: [PATCH 5/9] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <20160720155333.GE1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="k3qmt+ucFURmlhDS"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607172056220.3177@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:56:59PM +0200, Julia Lawall wrote:
>=20
>=20
> On Sun, 17 Jul 2016, SF Markus Elfring wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 17 Jul 2016 18:15:23 +0200
> >
> > Some return values can also be directly used for various condition chec=
ks.
> > Thus remove a local variable for intermediate assignments.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/staging/ks7010/ks7010_sdio.c | 81 +++++++++++++++-------------=
--------
> >  1 file changed, 34 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7=
010/ks7010_sdio.c
> > index eea18fb..b3ca8e2 100644
> > --- a/drivers/staging/ks7010/ks7010_sdio.c
> > +++ b/drivers/staging/ks7010/ks7010_sdio.c
> > @@ -90,7 +90,6 @@ static int ks7010_sdio_write(struct ks_wlan_private *=
priv, unsigned int address,
> >  void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
> >  {
> >  	unsigned char rw_data;
> > -	int retval;
> >
> >  	DPRINTK(4, "\n");
> >
> > @@ -99,9 +98,10 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_pr=
ivate *priv)
> >
> >  	if (atomic_read(&priv->sleepstatus.status) =3D=3D 0) {
> >  		rw_data =3D GCR_B_DOZE;
> > -		retval =3D
> > -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
> > -		if (retval) {
> > +		if (ks7010_sdio_write(priv,
> > +				      GCR_B,
> > +				      &rw_data,
> > +				      sizeof(rw_data))) {
>=20
> A multi-line function call in an if test does not look nice at all.  The
> original code was an easy-to-read expectable pattern.

I agree. I am not strict on the 80 char limit, especially in cases like
the above.


--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj559AAoJEBQN5MwUoCm2xK0P/RP6SWZ55DhDib78gWCAoOoi
gYYgmuEOvB4paljGWoua9gangS3aQZJ6xy2gmKxB4ERXf2c0jzQALeJJpB+vm31B
ky/wPhncv8E0T7os91WdFJWCHFC8BSvWGo0n9rz9yR7+LkS+HaLRoGZ2DmAGGMCv
ctTFszaARKVhLa8Ba31whoxqjvmfswFx5pFBL1glhcJp3SQhtk7AOncFq6xiLuGx
8jispV9E3b5NTr1c/AG+6GLDDvucmBbYCFYcqisgyRkT+hDDgCYPQOMyk9oxYwNG
YOPTjOYDRa5qt29eH9TJb9FfCjSKAJxVcRtwNvVK7h/x6QDtPc+lHBCJ/LSRBEez
2cK1y/00VKdssq4bgWF535kvRRndB7c8nagxQV9Wm9sabfU1iZe3boKomYb1rdB0
LmVzkmuGkc9uQlYhWCGV3MiJnUDm3nKUICOdsUGd0zWctOB9cXjESQh2QaTgqZUG
ssxezKegwQxcfvL5f2dK/obbaI8bsdwm5tkVPOLe2H5UPR/OEzlzZgQTz9EMC2ou
qzLfMmfPRvWnsWyHgJKNwAsdpzO0WQIOrWuUjMJZEsX9uWCO0Yq7HtF8vjpda/gQ
xsiA0UHzNoWnhyYqWPCJI2eTYqCyFnZntayOy/dWg2McviScDuRDcIPerydTI9Kb
uK5+RDTwT+/0TsPopShG
=t/44
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
