From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:56:01 +0000
Subject: Re: [PATCH 9/9] staging: ks7010: Delete three unnecessary variable initialisations
Message-Id: <20160720155601.GI1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UthUFkbMtH2ceUK2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <23b93bc6-f938-7f8c-8cf1-f70e453e06e6@users.sourceforge.net>
 <alpine.DEB.2.10.1607172049560.3177@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607172049560.3177@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:51:39PM +0200, Julia Lawall wrote:
>=20
>=20
> On Sun, 17 Jul 2016, SF Markus Elfring wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 17 Jul 2016 19:40:47 +0200
> >
> > Three variables will be set to an appropriate value a bit later.
> > Thus omit the explicit initialisation at the beginning.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/staging/ks7010/ks7010_sdio.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7=
010/ks7010_sdio.c
> > index e06bc3c..3c62c57 100644
> > --- a/drivers/staging/ks7010/ks7010_sdio.c
> > +++ b/drivers/staging/ks7010/ks7010_sdio.c
> > @@ -323,14 +323,14 @@ static void tx_device_task(void *dev)
> >  {
> >  	struct ks_wlan_private *priv =3D (struct ks_wlan_private *)dev;
> >  	struct tx_device_buffer *sp;
> > -	int rc =3D 0;
> >
> >  	DPRINTK(4, "\n");
> >  	if (cnt_txqbody(priv) > 0
> >  	    && atomic_read(&priv->psstatus.status) !=3D PS_SNOOZE) {
> >  		sp =3D &priv->tx_dev.tx_dev_buff[priv->tx_dev.qhead];
> >  		if (priv->dev_state >=3D DEVICE_STATE_BOOT) {
> > -			rc =3D write_to_device(priv, sp->sendp, sp->size);
> > +			int rc =3D write_to_device(priv, sp->sendp, sp->size);
>=20
> This does not look appealing to me, neither the declaration in the middle
> of the function, nor the intiialization to the result of a complex
> expression, nor the separation of the call and the error checking code by
> a blank line.  There is nothing wrong with having the rc variable be
> declared at the the top of the function, in its normal place.

+1


--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj58RAAoJEBQN5MwUoCm2CuAP/2B8tXxKMCNFpYaqMdvMhD3D
i9iipoOsW38It5gs2DKq17IvtnswUr5diNDxaPnhvtNgpa+AI1t1WAHNQEbSctKM
23q9xD1rh/yz/LzCtl4B3imOxnimbQXw+eXptgYdgEG5NRC+e/6pjSWrH/STvVVL
cXPQMp/zZjD2GEknWldRmhsLzSLMbSzUCao3Go1wLL7qJSXCtDmw5NQj3XRB2Wf9
a5JclgSIYoWVZ1skUuBTxZz+4kuGhP1CQ1cDM/bYZUciCAD+9li6f0MA71r0u9Hj
+EARtyMw7jJg/IYrcc3FpvYtK1bfQQ33q00t7V60KL80nHW6MGw0z5ZBcsoO6KYS
WhjQaUpAyINs2q95xObCkypIiF9r653Ifbm18nyttvEcA1Aufh0KV6YckuS5eaLZ
rxQlcnhvGOQSgafptSocnRHEpI2p8VCuP6T7TEjE7RbiVsj0sInmow1HOI93MYoB
e/fOgjTP5ap7okw4RxYk3KilAF5OaeLrrJW8OrEZH0BKLZqXHIZn286vH3RPMlA6
s/RN39RPG4ua2YfAJUGUR57eX9l+rV5lWBZ9aI7Wx4yzcuq161WPD/DEfRQq5GP9
hpxlfWUgjnCq3RBJ9+KU5HSztqSTyPzvkmzUGaXW/jb7qhWT0Bei23xjcwEx/yja
KLs1UIht2kfxzG6zm4He
=X5tI
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--
