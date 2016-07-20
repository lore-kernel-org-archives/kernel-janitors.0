From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:47:56 +0000
Subject: Re: [PATCH 3/9] staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <20160720154756.GC1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="WplhKdTI2c8ulnbP"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
 <alpine.DEB.2.10.1607172057500.3177@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607172057500.3177@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:58:14PM +0200, Julia Lawall wrote:
>=20
>=20
> On Sun, 17 Jul 2016, SF Markus Elfring wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 17 Jul 2016 15:55:02 +0200
> >
> > Return directly after a memory allocation failed at the beginning.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/staging/ks7010/ks7010_sdio.c | 19 +++++++------------
> >  1 file changed, 7 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7=
010/ks7010_sdio.c
> > index 3622fba..9b954cb 100644
> > --- a/drivers/staging/ks7010/ks7010_sdio.c
> > +++ b/drivers/staging/ks7010/ks7010_sdio.c
> > @@ -713,10 +713,8 @@ static int ks7010_sdio_update_index(struct ks_wlan=
_private *priv, u32 index)
> >  	unsigned char *data_buf;
> >
> >  	data_buf =3D kmalloc(sizeof(u32), GFP_KERNEL);
> > -	if (!data_buf) {
> > -		rc =3D 1;
> > -		goto error_out;
> > -	}
> > +	if (!data_buf)
> > +		return 1;
>=20
> One could rather wonder why the function has such strange error values...

Agreed. Markus, can you check if we can use -ENOMEM in those places.


--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj50sAAoJEBQN5MwUoCm2JAIP/1ATLUupOKVm1PezR7WlwBp3
usLFydHG4KoHAqr0oGqV+39MQ2ZEBVa38JY2Ufs1qrfqGuDxgTADKXb1qdibdE3+
DHr2iOHyDMcWqWqK+cFv24VZvVWKNs8J9ZEvJqm7EsEy5QqZSUqdh+JH3yjJnbyu
SwSo1Ex7XpKbyjOzoXXGk1GE+agnRfH92XkCxEg6+aTda5NRVkOnRuVE9FnD9LXr
jA+dKOFFTd2srWNhbJmo/GTV6Aet8hzHnZc9YyZX1JGgsYYP+3KWbgKqhZIK1TKX
VROORmKz/SQ4ofa/oqfbfkvWSMguKyF/IsaQakp9zlv3638LS9MsRAg5xyuq3KTN
yjxmINCP9eBslJKl7ZyGqL978QNi5kodSQKbdQL42BxWObXSjJ79BW7Lg33APtBt
7RT7ZqGNSQKmBAyPu5AFd+on7+BiHsKDtHWbn90ChSkT1VjsEy8vhGjB86aV3AxK
X5QL/BEm5fQuQ3jaytCQY1iM5IOMRE7b4Li76fimkHvg0sfAtzB3Al+CeUVUG2zE
c3EYaKj5vCanUrMqu7n7Rc5DSr5DrfpEA9jI+dwEa0+uge73maMJFYKxtOTdgxME
TriOuzPbx1oVFoBIF6mhoZGmFch7LLtB5j4kPQwSkENWZuyuXKixXtPJ7FwUellQ
pLlOYhsQFcuEHBTdrZxM
=tqKE
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
