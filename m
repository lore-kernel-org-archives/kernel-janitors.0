From: Martin Waitz <tali@admingilde.org>
Date: Mon, 23 Jan 2006 12:28:31 +0000
Subject: [KJ] Re: Fixing make mandocs
Message-Id: <20060123122831.GC11002@admingilde.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26718021207985609=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601230531.27609.ak@suse.de> <20060122204921.613349e5.rdunlap@xenotime.net> <200601230552.09142.ak@suse.de> <20060122205349.0ec46cbe.rdunlap@xenotime.net>
In-Reply-To: <20060122205349.0ec46cbe.rdunlap@xenotime.net>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: Andi Kleen <ak@suse.de>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org


--===============26718021207985609==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hoi :)

On Sun, Jan 22, 2006 at 08:53:49PM -0800, Randy.Dunlap wrote:
> > > > Here would be a good janitor task for 2.6.16. make mandocs
> > > > currently doesn't build because a number of descriptions are
> > > > missing parameters etc.  It would be good if someone could fix
> > > > that and submit patches for 2.6.16.

the thing that really breaks the build is the new __copy_to_user
prototype which kernel-doc could not understand.
This is fixed in my tree.

> > Ok good. Are they going into 2.6.16?

I'll try to get at least the one kernel-doc fix into 2.6.16.

--=20
Martin Waitz

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFD1Mvvj/Eaxd/oD7IRApu6AJ45f0HrOGg6WXYtKhYp6EFfYKZmPwCeNRzC
fvYrLMnd9IkBj7vIbW2Tvg4=
=KC1Y
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--

--===============26718021207985609==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26718021207985609==--
