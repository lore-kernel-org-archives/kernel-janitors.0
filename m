From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Thu, 09 Feb 2017 01:40:03 +0000
Subject: Re: [Intel-gfx] [patch v2] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <20170209014003.zachdfn4vemnpgy7@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vvlqrofhslhnzlag"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207145307.GA28648@mwanda>
 <1486558162.3142.44.camel@linux.intel.com>
In-Reply-To: <1486558162.3142.44.camel@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jike Song <jike.song@intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>


--vvlqrofhslhnzlag
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.02.08 14:49:22 +0200, Joonas Lahtinen wrote:
> On ti, 2017-02-07 at 17:53 +0300, Dan Carpenter wrote:
> > "caps.buf" is always NULL here and "caps.size" is always zero.=A0=A0The=
 code
> > is a no-op and can be removed.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>=20
> I assume Zhenyu will merge this through their tree.
>=20

yeah, already put in queue. Thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--vvlqrofhslhnzlag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlibyHIACgkQsQQaM014GCeKygCeKuN44VPFEFNouj761ANuKtL3
LygAnilTlsBKEyfZK6GWZqiSrcy3h9OS
=Y9up
-----END PGP SIGNATURE-----

--vvlqrofhslhnzlag--
