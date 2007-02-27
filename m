From: Ira Snyder <kernel@irasnyder.com>
Date: Tue, 27 Feb 2007 19:20:59 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070227112059.1452cacb.kernel@irasnyder.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1374083593=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============1374083593==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__27_Feb_2007_11_20_59_-0800_i0w3ZoWgiANrdSj4"

--Signature=_Tue__27_Feb_2007_11_20_59_-0800_i0w3ZoWgiANrdSj4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Tue, 27 Feb 2007 11:12:00 -0500
burns.ethan@gmail.com wrote:

> On Tue, Feb 27, 2007 at 10:03:25AM +0100, Standard Azi wrote:
> > char buf[150];
> >
> > strcpy(buf, "LALA");
> >
> > that's one reason, for example
>
> char buf[150] = "LALA";
>
> and if you really need to do it outside of initialization, does the strncpy()
> really hurt it?  What if the size of `buf' gets changed, then we would have to
> go check for all strcpy()s and make sure that they are still valid, where
> strncpy would do it by default.
>

Also, what about strlcpy()? It's a drop-in replacement for strncpy(), _ALWAYS_ null terminates the destination string (strncpy() doesn't), and doesn't have to pad out the destination string strncpy().

I pretty much always find it better than strcpy() and strncpy().

Ira

--Signature=_Tue__27_Feb_2007_11_20_59_-0800_i0w3ZoWgiANrdSj4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.2 (GNU/Linux)

iD4DBQFF5ISrqvO4Mr6SCJURAvC1AJiBZ03H90jcAAISGkhZ7RP8xjd7AJ90yT0I
CT7W/OPD1+BlK/jwRDy8Vg==
=6mqk
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Feb_2007_11_20_59_-0800_i0w3ZoWgiANrdSj4--

--===============1374083593==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1374083593==--
