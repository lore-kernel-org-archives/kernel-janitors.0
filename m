From: Eric Anholt <eric@anholt.net>
Date: Fri, 19 Dec 2008 22:52:11 +0000
Subject: Re: [PATCH 0/6] drm/i915: fix sparse warnings
Message-Id: <1229727131.6544.7.camel@gaiman.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Yz4GIFRXm9oif3k2hX26"
List-Id: <kernel-janitors.vger.kernel.org>
References: <494ad5ce.06e2660a.73b0.ffffd586@mx.google.com>
In-Reply-To: <494ad5ce.06e2660a.73b0.ffffd586@mx.google.com>
To: Hannes Eder <hannes@hanneseder.net>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--=-Yz4GIFRXm9oif3k2hX26
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-12-18 at 23:27 +0100, Hannes Eder wrote:
> This series of patches fixes a couple of sparse warnings in drm/i915.
>=20
> Hannes Eder (6):
>   drm/i915: fix sparse warnings: declare one-bit bitfield as unsigned
>   drm/i915: fix sparse warnings: make symbols static
>   drm/i915: fix sparse warnings: move 'extern' decls to header file
>   drm/i915: fix sparse warnings: returning void-valued expression
>   drm/i915: comment out unused function 'i915_driver_firstopen'
>   drm/i915: add prototype for 'intelfb_panic' to header file

Committed this patch series, except for replacing #5 with just deleting
the function, and using the updated #6 patch.  Thanks!

--=20
Eric Anholt
eric@anholt.net                         eric.anholt@intel.com



--=-Yz4GIFRXm9oif3k2hX26
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAklMJZsACgkQHUdvYGzw6vd+XgCcD2Gpf/NEWNM3KZL7B4ZNwkY2
pLEAoIBK+5UtVrmgmQ0M9XOxOh2UA6CH
=MNBF
-----END PGP SIGNATURE-----

--=-Yz4GIFRXm9oif3k2hX26--

