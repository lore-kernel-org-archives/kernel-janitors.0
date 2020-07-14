From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 14:39:24 +0000
Subject: Re: [PATCH] decnet: dn_dev: Remove an unnecessary label.
Message-Id: <20200714142724.GC12651@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nmemrqcdn5VTmUEE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714141309.GA3184@blackclown>
 <alpine.DEB.2.22.394.2007141615490.2355@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007141615490.2355@hadrien>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: davem@davemloft.net, kuba@kernel.org, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 04:16:15PM +0200, Julia Lawall wrote:
>=20
>=20
> On Tue, 14 Jul 2020, Suraj Upadhyay wrote:
>=20
> > Remove the unnecessary label from dn_dev_ioctl() and make its error
> > handling simpler to read.
> >
> > Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> > ---
> >  net/decnet/dn_dev.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/decnet/dn_dev.c b/net/decnet/dn_dev.c
> > index 65abcf1b3210..64901bb9f314 100644
> > --- a/net/decnet/dn_dev.c
> > +++ b/net/decnet/dn_dev.c
> > @@ -462,7 +462,9 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
> >  	switch (cmd) {
> >  	case SIOCGIFADDR:
> >  		*((__le16 *)sdn->sdn_nodeaddr) =3D ifa->ifa_local;
> > -		goto rarok;
> > +		if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
> > +			ret =3D -EFAULT;
> > +			break;
>=20
> The indentation on break does not look correct.
>=20
> julia

Thanks for your response and advise, sent a v2 patch.

Suraj Upadhyay.

> >
> >  	case SIOCSIFADDR:
> >  		if (!ifa) {
> > @@ -485,10 +487,6 @@ int dn_dev_ioctl(unsigned int cmd, void __user *ar=
g)
> >  	rtnl_unlock();
> >
> >  	return ret;
> > -rarok:
> > -	if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
> > -		ret =3D -EFAULT;
> > -	goto done;
> >  }
> >
> >  struct net_device *dn_dev_get_default(void)
> > --
> > 2.17.1
> >
> >

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8NwMwACgkQ+gRsbIfe
7448rw/8CA0mN5m4dMvP++UvjZdJ1C3W10rugWZhiILK1fXwPVSC2iq8TObE68/y
cKa8wGLAys54MwDw4fdsOOFieElaJU0JQDJhOEd7aXWoEGlD4kYPUTbydcJ/v150
iMJPsNYY/M5Ey5p7VYxkzidFlzNB+lFUJX8DQQNyk9SuYcNB0O+UWx3G2IoFL1WH
e81mupXoy71MSVj1gPshhN1U8m9qWKTUI3o6ynZSq6enK7x8S6VZGRmn2/6vo6HN
MOeHyhloMe6p1nbm9EyzvkrDXbM89E0v9NqKhk2ldcz5ZKABS2j6PSlsOlEFIBFj
ds9qLL3qR1+yYRLx9snSu7AVu50+JhegouehaVjPgl/JDpsLfzHE3QFWMNZ8pFDC
jiFCw+edOH9+sXC6Z3PgAN9LHBb2ruJ/X+OujW1LjJcAY5r506eCHLWk+NOEsioL
/HUfuwuVISgjfOLCgBMRps7KnpgKCo0C+hIqNd//nre8JxD+xYfR5c3emyrrjI4s
zMJlfdyIl8CCcI8VLF17Pkrl/s3qMzq6/+c4xdOBIJ1yEr62LLDamtFuyMxU7mMU
ynYb22kqKj99dY4jf6JgZ2dCjknb3SO4APhoX4eQ1Sfbydty53Fo5U1G3ZT3NaQu
LGucRfr/qnNlBzEe+pxod43+ZJkX6+A4tOSj/vTqdJeT79mENh0=
=SLPg
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
