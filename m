From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 19 Dec 2004 21:00:38 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <200412192200.44211.tklauser@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46414803756969514=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============46414803756969514==
Content-Type: multipart/signed; boundary="nextPart1242102.zr2WRIXley";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1242102.zr2WRIXley
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi

On Sunday 19 December 2004 20:09, Andi Kleen wrote:
> Short howto:
>
> Get
> ftp://gcc.gnu.org/pub/gcc/snapshots/4.0-20041219/gcc-core-4.0-20041219.ta=
r.
>bz2
>
> Untar it and compile with
>
> mkdir obj
> ../gcc-*/configure --disable-checking --enable-languages=3Dc
> --prefix=3D/usr/local/gcc4 make bootstrap
> <as root>
> make install
>
>
> Then compile an uptodate 2.6 kernel with:
>
> make allmodconfig
> make CC=3D/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
> grep warning LOG
Cool howto, thanks. Maybe that should go onto the TODO list over at=20
kerneljanitors.org?

>
> You'll see lots of warnings in LOG. Fix them all and submit patches
> through the usual janitor channels.

I already compiled GCC4 and it took about 15 minutes on an Athlon Tbird 1.4=
=20
GHz to finish. When compiling Linux 2.6.10-rc3 with GCC4 there are lots of=
=20
warnings (as expected) and even a fatal error.
So I'm trying to fix some of these warnings. They are all over the kernel t=
ree=20
and so I'm curious what would be the best method to split and submit the=20
patches?

Thanks, Tobias

=2D-=20
Tobias Klauser <tklauser@nuerscht.ch>

GPG-Key 0x3A445520 http://tklauser.politux.org/tklauser.asc
    Fingerprint =3D 7474 D486 E4FC 5113 561D  B1E3 72BC 0E7E 3A44 5520

--nextPart1242102.zr2WRIXley
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBxev8crwOfjpEVSARAultAKDJfH9LxWlomSi8OTzzQIMaZzXMegCfV2W4
/G7+5etCGndIXOtz4XojXgc=
=hBke
-----END PGP SIGNATURE-----

--nextPart1242102.zr2WRIXley--

--===============46414803756969514==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46414803756969514==--
