From: Wolfram Sang <w.sang@pengutronix.de>
Date: Mon, 17 May 2010 09:31:23 +0000
Subject: Re: [PATCH 0/4] Add a Coccinelle front-end script
Message-Id: <20100517093123.GE22781@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="M/SuVGWktc5uNpra"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk> <20100511021416.GA7125@hexapodia.org>
In-Reply-To: <20100511021416.GA7125@hexapodia.org>
To: Andy Isaacson <adi@hexapodia.org>
Cc: Nicolas Palix <npalix@diku.dk>, Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Kernel Janitors <kernel-janitors@vger.kernel.org>


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2010 at 07:14:16PM -0700, Andy Isaacson wrote:
> On Mon, May 10, 2010 at 06:24:23PM +0200, Nicolas Palix wrote:
> > New targets are added (coccicheck-<mode>) to call the 'coccinelle.sh'
> > front-end in the 'scripts' directory with the <mode> argument.
> >=20
> > Four modes are defined: report, patch, context, and org.
>=20
> Please check-in this write-up somewhere (Documentation/README.coccinelle
> perhaps?)

I still haven't made my mind regarding these four modes; but if they are us=
ed,
they should be documented. ACK.

> Also I'd like to see a short example of how to use the framework.  I've
> read Val's spatch article (http://lwn.net/Articles/315686/) and it's
> still a bit of a black art to me.

Something like this? :)

https://lwn.net/Articles/380835/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvxDOsACgkQD27XaX1/VRt83QCfbWZzqpu2iFUbvrst8ye9gpgD
nVQAnRFqz0OzSgnWPZ3vzoLYKL49bzGJ
=PDPy
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
