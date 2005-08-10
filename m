From: Erik Mouw <J.A.K.Mouw@its.tudelft.nl>
Date: Wed, 10 Aug 2005 20:24:17 +0000
Subject: [KJ] Re: Kernel Development and Cogito
Message-Id: <20050810202417.GA5387@arthur.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27204827030451795=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============27204827030451795==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2005 at 01:23:14PM -0400, Gabriel Devenyi wrote:
> I would like to start working on some kernel-janitor stuff, and I've=20
> cloned Linus' tree using Cogito (cg-clone). My issue is that I can't=20
> find any documentation on how I would go about working on this tree now,=
=20
> like if I make a change, how do I create a patch that I can send off to=
=20
> kernel-janitors, and LKML, similarly, how would I reset my tree to be=20
> exactly like Linus' if I muck something up badly. Is there a document=20
> out there describing the usage of Cogito, or can someone outline the=20
> basics of using Cogito to dump my changes for distribution? Thanks for=20
> your help!

This one is from Cogito itself:

  http://www.kernel.org/pub/software/scm/cogito/README

Jeff Garzik wrote a Git "howto" (the system that lives under Cogito):

  http://linux.yyz.us/git-howto.html

IIRC Randy Dunlap also wrote something, but I can't find it.


Erik

--=20
Erik Mouw
J.A.K.Mouw@its.tudelft.nl  mouw@nl.linux.org

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC+mJx/PlVHJtIto0RAsw8AJ47MRCbln7/3c2Ac6eWCGIkjCblvQCfYDah
WNCM6eaH3wS00cnvNon1kXs=
=jeq7
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============27204827030451795==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27204827030451795==--
