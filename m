From: Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 28 Jan 2015 07:59:17 +0000
Subject: Re: [patch] drm/bridge: checking the wrong variable
Message-Id: <20150128075915.GA23469@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128064335.GC30893@mwanda>
 <CAGS+omBhW+NRm01zGdZDLjWkO1w7D+ZTRt7_uZpvdQqvy1+gew@mail.gmail.com>
In-Reply-To: <CAGS+omBhW+NRm01zGdZDLjWkO1w7D+ZTRt7_uZpvdQqvy1+gew@mail.gmail.com>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@oracle.com>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2015 at 02:46:46PM +0800, Daniel Kurtz wrote:
> Hi Dan,
>=20
> nit: this patch is not really for "drm/bridge".
>=20
> On Wed, Jan 28, 2015 at 2:43 PM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> >
> > We were supposed to check "fmts" here instead of "formats".  I suppose
> > it eventually leads to a NULL dereference.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
>=20
> Otherwise, good catch!
>=20
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

I've reworded the commit message slightly and applied this. Thanks.

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUyJbTAAoJEN0jrNd/PrOhKR0P/19jT5hgxTZ5YP6uO6/I1Eic
QpiN9ao41ImAW82XOLTn5OWs02F2X7QyWogQXHIC6aasadjQKJlQr0H3HLFWgcBk
jJwuTVEUlu0TgFeqSu1ryR9tFjUF8+Dy+IQPiOENe5EqfU/leysj49jwC1yacc39
k7do+l8OE9hnm5vOPmkFJcMzkgqwOFrkywPCqujh+sHmFjMty9YZ+VX6uNj4VaVh
L/VYGqLQF1R9PFLT57u71cYf54wKigw35zfCJhvrLLbjQJvNJi0YAF+wt0Gx0fUG
cj5d9k1tHwrmcoWsiuMSkif2VF2xnGXYv4c8sB+XD9VGpbg6I2UuqvIvZnc6FXwj
eLIIQwvxShCgMOz6hFtWDpkhEgR5R+H67QzazdPA8lJdKS2cAa6davXhfqcP/4nM
XIHPay9Pe8Yh2qrI96bUpBryvFlUU2y1REV3XC6iwRQ1EChO6xK5HLdDzKZQUa6P
u/Pg+OVS6EjXxnEmeYm3ZXudhWYBiA1oe4+KFJT0NTLNtqq06jMUXppsaYhyMY+C
kSGQznzbQFa/MJcQDqtT5MA1YVhdF/2muOl9TeWqHaGeo5GfjrZ2I/9nUvWUsnum
IhrY1w5hzloyMnwD/fhqQ15aGwAcxhL5SUoNhbVLxShojTrE/Pvs6XWQDcWp1DNS
spgQSOfJdM55P68iAsvu
=EIlL
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
