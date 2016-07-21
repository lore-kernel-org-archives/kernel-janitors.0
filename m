From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 21 Jul 2016 07:29:11 +0000
Subject: Re: [PATCH 5/9] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <20160721072911.GF1664@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="z0eOaCaDLjvTGF2l"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien>
 <20160720155333.GE1688@katana>
 <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
 <20160721062726.GC1664@katana>
 <alpine.DEB.2.10.1607210925200.2927@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607210925200.2927@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 09:26:33AM +0200, Julia Lawall wrote:
>=20
>=20
> On Thu, 21 Jul 2016, Wolfram Sang wrote:
>=20
> >
> > > >>>  	if (atomic_read(&priv->sleepstatus.status) =3D=3D 0) {
> > > >>>  		rw_data =3D GCR_B_DOZE;
> > > >>> -		retval =3D
> > > >>> -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
> > > >>> -		if (retval) {
> > > >>> +		if (ks7010_sdio_write(priv,
> > > >>> +				      GCR_B,
> > > >>> +				      &rw_data,
> > > >>> +				      sizeof(rw_data))) {
> > > >>
> > > >> A multi-line function call in an if test does not look nice at all=
=2E  The
> > > >> original code was an easy-to-read expectable pattern.
> > > >
> > > > I agree. I am not strict on the 80 char limit, especially in cases =
like
> > > > the above.
> > >
> > > Would you try an other source code formatting for the suggested chang=
e pattern?
> >
> > I don't understand the question?
>=20
> I think the original code was fine.  x =3D blah(); if (x) ... is a perfec=
tly
> familiar kernel coding pattern.  There is no benefit in terms of
> performance or understandability in dropping the variable.

I certainly agree to that.


--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkHnHAAoJEBQN5MwUoCm2Vn0P/i86vLhkB6CnmLv773nhFmUh
ze8TyG9d2bLukVUGBAw2uQ/Xkns9AWmobBCEis/3dcvxbSyeXU9gATamxEiKkggb
N6BCtEd1f98KK30oGqGLSgFjCM+fHXxgEHKw2ILUSwkCZgY14EnH1Hs+XMf6UbzL
pDghLCw7B19NcWnYm+me4JultieLnTmdYXfPfqCpK5l/bDV4fTU/zWNaqzkme23V
zx1jvfGtmEKIH1AVFB8sPphmcCoKjz3owApIxvCt5AexiT9XMB0Ha0+S2XyuBqwP
7EZyXjvpsSo/16Q+qaz+uihTkYGdSfwAaLkY3Ozhah+gTP5h9KQd/WPRWDb0/Qeg
oNS5zaKn2ZT3rGQMjdifuDniVOIWTZJVcn9Q7LQhxXXhmjaBARRhxstSw4yUmyib
bVvqm++cKJ/smCqZKmAbvgGyWIQGyHCRyY/Fq3si7npTFcwp2cSFO1YxN1Ovj3Pw
L0cCt/SfmPzZQlBDAJ9TSKP7uo/9jvKvBLEBcvmbpR2NYDufrJ17ZNfetH7C4GBR
S+3YDAji42GwrrEtAiXdENxIG7uDJxwcUTlrzXkrv3/v7dHo9/R9UmcMtXwXHk7O
XR3xZZmvcJgDQEdFZVlbORCjY8rG175/mwgtout/Gzqe5Gfh1AaZxd3cAwt3eXqd
Z3qEMrszHk61rC1LHYog
=rmsX
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
