From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 07 Jan 2020 14:05:26 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix an error code in intel_modeset_all_tiles()
Message-Id: <157840592663.2273.15929240102084093971@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130322.gdk5b6jurifr26c2@kili.mountain>
 <04c2960a11f5361288d7d3a8a3bd16301b05c5e5.camel@intel.com>
In-Reply-To: <04c2960a11f5361288d7d3a8a3bd16301b05c5e5.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "Souza, Jose" <jose.souza@intel.com>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Quoting Souza, Jose (2020-01-07 14:01:40)
> On Tue, 2020-01-07 at 16:03 +0300, Dan Carpenter wrote:
> > There is a cut and paste bug so we return the wrong error code.
> >=20
> > Fixes: a603f5bd1691 ("drm/i915/dp: Make sure all tiled connectors get
> > added to the state with full modeset")
>=20
> Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed. Thanks for the patch,
-Chris
