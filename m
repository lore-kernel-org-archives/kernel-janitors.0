From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 24 Sep 2020 23:15:32 +0000
Subject: Re: [PATCH] drm/i915: Uninitialized variable in i915_gem_object_map_page()
Message-Id: <20200925091532.71ba87d4@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/eQPpKG3fwyzGW7y9XzMq/C9"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200924081830.GA1568157@mwanda>
In-Reply-To: <20200924081830.GA1568157@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>

--Sig_/eQPpKG3fwyzGW7y9XzMq/C9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 24 Sep 2020 11:18:30 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> The "i" iterator is never set to zero.  This probably doesn't affect
> testing because GCC sometimes initializes variables and also we have a
> new pluggin to initialize stack variables to zero.
>=20
> Fixes: 7edd32a9e614 ("drm/i915: use vmap in i915_gem_object_map")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Andrew, this should probably go through the -mm tree and get folded
> into the original patch.

Added to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/eQPpKG3fwyzGW7y9XzMq/C9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tKJQACgkQAVBC80lX
0GxICwf+O7nALSW2YNzsYpFHHJ6OdT58gcC8y81KGx6ZLHXVkc939hnK58waJe1C
5hqeYI1asKx5zLWYh6wKqDblPelbRmY8U+oPeaJDzT1fyCzAgZuUWPxZ2Nf7khk7
ewrQuU2k6ndzE0C3PZDYtfLZ01eGYGrIJqujN79OQX9IDKBuE0f8JtRDkKYbTtte
n9g6tmzLRp+OLjwmnb6ePJX2sEJLszPiq7iLOWZlR19ZCa8+g0MPwJrdNWqtd6Jz
SdN1xtF4QyokJBTsXY4LFZ8Kjc9JCEUEmzFLaZIiNgulCUQI86nHnO13KIvdYmi4
6ghnhUfnW/mQM7apj8wiL7Tcwc6CAA==
=3vsg
-----END PGP SIGNATURE-----

--Sig_/eQPpKG3fwyzGW7y9XzMq/C9--
