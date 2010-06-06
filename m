From: Sven Eckelmann <sven.eckelmann@gmx.de>
Date: Sun, 06 Jun 2010 07:41:36 +0000
Subject: Re: [PATCH] drivers/staging/batman-adv: fix function prototype
Message-Id: <201006060943.22104.sven.eckelmann@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart3450853.vajKsWSMma"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275787408.10961.13.camel@lenovo>
In-Reply-To: <1275787408.10961.13.camel@lenovo>
To: kernel-janitors@vger.kernel.org

--nextPart3450853.vajKsWSMma
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 June 2010 03:23:28 you wrote:
> In today linux-next I got a compile warning in staging/batman-adv.
>=20
> This is due a struct bin_attribute read function prototype change and the
> driver was not updated.
>=20
> This patch solves the issue
>=20
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
[...]
>=20
> -static ssize_t transtable_local_read(struct kobject *kobj,
[...]
>=20
> -static ssize_t transtable_global_read(struct kobject *kobj,
[...]
>=20
> -static ssize_t originators_read(struct kobject *kobj,
[...]
>=20
> -static ssize_t vis_data_read(struct kobject *kobj,
[...]

These files were already removed and the patch is waiting in GregKH's queue.

Best regards,
	Sven

--nextPart3450853.vajKsWSMma
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABCgAGBQJMC1E0AAoJEF2HCgfBJntGmi4P/RYJbLJ7zxlEshSohIOFH7Cb
znV9Pja6lCb8rt7N5GENw/kUT69UODP/E09dQ4L7d6hVTair9+qiyy9RDgw6w/Oj
bYglUcDTO2iQz8hjEMzFpQa+0e8GjlJ4U03jlTn4Sn0e9ngKfvHB5FvEoBm2Ldvt
mK8NqsAhFCwNBPtEzxvkLruyPddicrIjVr38D2YwN4gXnmn1v5sBBDIcsYQt0RsT
9rh0abZWZqKImMF3fTV/QIWa/a5CMohVjVTxEuhTasgjVZ0baHLgWmuNMRd5cmrs
a6H1UTn9DAzVHRdDNtwMh04FQQUfdn2LDGhHHmLLFO5Dqk7aFb/7erLb51gic4sc
kw9z3SeGgqmHsUfEjBhZLZDjPiQLEigFH2YyXEMcjTnd+iGOTkTRooPXLinadOAz
UZWKLYmFhBc+T/SeDXBSsYNPPueirlD6P4WkLI5pXEAGLdvhdH+DnLLw+i0OOIkQ
D87Vkez4FVd89ukfkJ8aYAeuEnirhC/Og6UpZPCP8aQCpt7kLdvUENheFxzTau5p
f9dPr4M6aSuVKFEWQA4jkpBroZzyGtihRzYg//8Luu25dMRy6v0BqRETbgJmLqy8
SshYa8e73eXcZ8BFKOpLa7YieQ8GXwHgtcwB1h/tOnAHNEXH+pBV3VigjcskcJrM
1ph01pL8Giaxr7d9659v
=IiG3
-----END PGP SIGNATURE-----

--nextPart3450853.vajKsWSMma--
