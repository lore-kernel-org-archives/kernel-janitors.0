From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Sep 2004 13:24:00 +0000
Subject: Re: [Kernel-janitors] LinuxCPD - New mini project
Message-Id: <200409291524.04624.arnd@arndb.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80822488805658899=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040929010532.82474.qmail@web41005.mail.yahoo.com>
In-Reply-To: <20040929010532.82474.qmail@web41005.mail.yahoo.com>
To: kernel-janitors@vger.kernel.org


--===============80822488805658899==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_0drWB9N6Tkteyls";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit


--Boundary-02=_0drWB9N6Tkteyls
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mittwoch, 29. September 2004 03:51, Jon Masters wrote:
> On Tue, 28 Sep 2004 18:05:32 -0700 (PDT), Aaron Grothe
> <ajgrothe@yahoo.com> wrote:
>=20
> > I've put a small project up at Sourceforge http://linuxcpd.sf.net
>=20
> > Looking at I'm happily surprised about
> > how much less duplicated code there appears to be in the 2.6 kernel ser=
ies.

Much of the improvements can probably be attributed to merging the 64 bit
subarchitectures of mips and s390 into their respective 32 bit trees.

> Generally a good thing. It does reveal quite a few duplications
> between ppc and ppc64 trees which might be worth pursuing sometime.

It may not be a good idea to follow the same route as mips and s390
for ppc64 and completely get rid of the 64 bit tree, because the ppc64
tree already doesn't need much of the legacy code in ppc.
OTOH, it would be nice to share the include/asm tree in order to
simplify life for multilib build environments. For arch/ppc*/, we
could follow the approach of x86_64, where the files with identical
functionality are simply built in the arch/i386 tree. See the
patch below for a trivial example of this (these two files are
already identical on ppc and ppc64).
Unifying the xmon directory could be something more interesting.

	Arnd <><

diff -u -r1.2 Makefile
=2D-- ./arch/ppc64/lib/Makefile	7 Sep 2004 10:32:45 -0000	1.2
+++ ./arch/ppc64/lib/Makefile	29 Sep 2004 13:06:00 -0000
@@ -2,8 +2,11 @@
 # Makefile for ppc64-specific library files..
 #
=20
=2Dlib-y :=3D checksum.o dec_and_lock.o string.o strcase.o
+lib-y :=3D checksum.o string.o=20
 lib-y +=3D copypage.o memcpy.o copyuser.o
+
+obj-y +=3D ppclib.o
+ppclib-y :=3D $(addprefix ../../ppc/lib/,dec_and_lock.o strcase.o)
=20
 # Lock primitives are defined as no-ops in include/linux/spinlock.h
 # for non-SMP configs. Don't build the real versions.

--Boundary-02=_0drWB9N6Tkteyls
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBWrd05t5GS2LDRf4RAm3bAJwN5xmozSU+kBvIlpkcn/VOhl61PACcCug7
CkpdPXLfojLCgarVhXdYQqM=
=5Y/q
-----END PGP SIGNATURE-----

--Boundary-02=_0drWB9N6Tkteyls--

--===============80822488805658899==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80822488805658899==--
