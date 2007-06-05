From: Pierre Habouzit <madcoder@debian.org>
Date: Tue, 05 Jun 2007 11:37:21 +0000
Subject: Re: [KJ] for loops and variable declarations...
Message-Id: <20070605113721.GH10354@.intersec.eu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5662731947364591878=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
In-Reply-To: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--===============5662731947364591878==
Content-Type: multipart/signed; boundary="Fnm8lRGFTVS/3GuM";
	protocol="application/pgp-signature"; micalg=SHA1
Content-Disposition: inline


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2007 at 06:22:40PM +0700, Kevin Jackson wrote:
> Hi all,
>=20
> I'm just looking at kernel code for basically the first time - so
> please be patient :)
>=20
> I'm seeing this style of code:
>=20
> uchar a
> ....
> ....
> ....
> ....
> ....
> ....(many lines later...)
> for(a=3D2; a< VALUE; a++)
>=20
>=20
> Why are loop variables declared so far away from where they are used?

  because C forbigs in-code variable declarations (unlike C++). GNU C
authorizes it though.

> Is this advantageous in some way?  It seems that the scope of the
> variables is much larger than having them declared just as they are to
> be used eg:
>=20
> for(uchar a=3D2; a<VALUE; a++)

  This for is only allowed in C99, and is not well defined on some
compilers where a scope is not necessarily limited to the for loop as
common sense would suppose.

  So IMHO, kernel do not uses such kind of code (but I may be wrong).

--=20
=C2=B7O=C2=B7  Pierre Habouzit
=C2=B7=C2=B7O                                                madcoder@debia=
n.org
OOO                                                http://www.madism.org

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGZUrxvGr7W6HudhwRAlynAJsGyB3gxlGHVrlviW65Bgx/5wV46wCeIGJX
wTpYW2hnramHIWdBRqJooeQ=
=lpNn
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--

--===============5662731947364591878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============5662731947364591878==--
