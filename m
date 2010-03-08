From: Sven Eckelmann <sven.eckelmann@gmx.de>
Date: Mon, 08 Mar 2010 16:23:06 +0000
Subject: Re: [B.A.T.M.A.N.] FWD: batman: potential null dereference
Message-Id: <201003081723.06876.sven.eckelmann@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1302465.Y0fTrzrNYY"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--nextPart1302465.Y0fTrzrNYY
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dan Carpenter wrote:
[...]
> > It looks a little bit like checked with clang's static analyzer. This
> > analyzer has problems to track constraints at all. This means that it
> > doesn't catch the update_routes constraint "orig_node->router !=3D
> > neigh_node".
> >
> > But I am also not good at tracking that kind of constraints and reported
> > this or a similar "bug" in batmand a while ago.
> >
> > So it is not a real bug, but maybe not easy to read.
>=20
> Yeah.  I see what you mean...

Good. And thanks for the bug report. It is always good that someone looks o=
ver=20
the code :)

Best regards,
	Sven

--nextPart1302465.Y0fTrzrNYY
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABCgAGBQJLlSRqAAoJEF2HCgfBJntGpX8P/iFcEdKtce6pG0Qed5CZZW41
3OLi7GihzgOzRpUtcxBkLi4WAo+rU95kQfkct31dhLNv3T/HDf8TecRjv9+g12qI
ZwG0y77rqGR/X+6l/5+vklVz30ucfiVkIy4pkQPqZ30OnJe29LAfFjo9mBwxH5rL
OmJpTdPPwaXnyj1k1jCr7zQi9RojTptGAXnaBSSQUAO3LE/6E3rrp5BV2MLORTmn
bKDE6SzcWnvE4DQVz2ThmcWDodWNo66ULxYVXFsaRRXSrJtvfrenaao/HrM8DpPf
0izE4ddgQhxDwB4k16bwMmOfVHfgJi/geCsQStNqBre72ghW+Qn8KUIhJui17f7i
5VHzVXTfL0VfMrIwhp+bre1yn9Ll+vetQFIVc/g9CoxoO/R6P10TLr7gD14hYvFP
xccOFVAO2Hn2QDOqcwnyAt8RHfgkQPBIentbgQDcJUpM5T7RxJOAEDUQMRpYwRPG
SFPevjAOxumEgeY6edmPW73Oan82dF4oV2LPaNdGww/PuSRGXGGuGCdC0xk232Fb
02SJTwmnKMEAoLSY5p93Ly1hSnPRXAPY1ns1W8xnZZ7zUOJwf/Tozr1xt56ps+Ir
4LAdwZwRNX7L+CD17lFRl+K5NTrKUFUjJsC7C2ijxPnRoFx3QiCf3+ZEz4hXJ3uz
tiVkQcIbb3XX0BOoYe9r
=FI4E
-----END PGP SIGNATURE-----

--nextPart1302465.Y0fTrzrNYY--
