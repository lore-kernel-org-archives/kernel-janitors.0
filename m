From: Matt Domsch <Matt_Domsch@dell.com>
Date: Sat, 24 Jul 2004 14:51:04 +0000
Subject: [Kernel-janitors] [RFP] add MODULE_VERSION() tags to all modules
Message-Id: <20040724145104.GA20757@lists.us.dell.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35871858276019442=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============35871858276019442==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Request for Patches

The 2.6.x kernel includes a MODULE_VERSION() parameter for providing
one convenient way for all modules to state what  *their* version is
(as opposed to the version of the larger kernel they're included in).

I've started submitting patches to the subsystem maintainers to add
MODULE_VERSION() entries for drivers that I particularly care about,
and would appreciate assistance handling the others.

For modules which display their version as a string somewhere via
printk, the preferred mechanism is:

#define DRV_VERSION "1.0.0"
MODULE_VERSION(DRV_VERSION);

One aspect of MODULE_VERSION I haven't tackled is re-formatting
existing versions into the preferred method as found in include/linux/modul=
e.h:

/* Version of form [<epoch>:]<version>[-<extra-version>].
   Or for CVS/RCS ID version, everything but the number is stripped.
  <epoch>: A (small) unsigned integer which allows you to start
   versions
           anew. If not mentioned, it's zero.  eg. "2:1.0" is after
           "1:2.0".
  <version>: The <version> may contain only alphanumerics and the
           character `.'.  Ordered by numeric sort for numeric parts,
           ascii sort for ascii parts (as per RPM or DEB algorithm).
  <extraversion>: Like <version>, but inserted for local
           customizations, eg "rh3" or "rusty1".
*/

I leave such reformatting up to each driver author and/or patch
submitter.

Thanks,
Matt

--=20
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBAndYIavu95Lw/AkRAg5bAJwJyaRgkMTkF4XdwecCeGFFJlAsGgCeO83P
+3J8FHIdHf45bTqhhCmoWys=
=o/bU
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

--===============35871858276019442==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35871858276019442==--
