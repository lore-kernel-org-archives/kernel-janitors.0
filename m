From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Wed, 20 Sep 2017 22:44:06 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <20170920224406.jscthkglwfy3xhtf@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7krksihms4pcky4w"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919155534.25334-1-colin.king@canonical.com>
 <20170919214614.cfiolgznopouv34e@zhen-hp.sh.intel.com>
 <1505874923.2067.14.camel@perches.com>
In-Reply-To: <1505874923.2067.14.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: fred gao <fred.gao@intel.com>, intel-gfx@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Colin King <colin.king@canonical.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>


--7krksihms4pcky4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.09.19 19:35:23 -0700, Joe Perches wrote:
> On Wed, 2017-09-20 at 05:46 +0800, Zhenyu Wang wrote:
> > On 2017.09.19 16:55:34 +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > >=20
> > > An earlier fix changed the return type from find_bb_size however the
> > > integer return is being assigned to a unsigned int so the -ve error
> > > check will never be detected. Make bb_size an int to fix this.
> > >=20
> > > Detected by CoverityScan CID#1456886 ("Unsigned compared against 0")
> > >=20
> > > Fixes: 1e3197d6ad73 ("drm/i915/gvt: Refine error handling for perform=
_bb_shadow")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/=
i915/gvt/cmd_parser.c
> > > index 2c0ccbb817dc..f41cbf664b69 100644
> > > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > @@ -1628,7 +1628,7 @@ static int perform_bb_shadow(struct parser_exec=
_state *s)
> > >  	struct intel_shadow_bb_entry *entry_obj;
> > >  	struct intel_vgpu *vgpu =3D s->vgpu;
> > >  	unsigned long gma =3D 0;
> > > -	uint32_t bb_size;
> > > +	int bb_size;
> > >  	void *dst =3D NULL;
> > >  	int ret =3D 0;
> > > =20
> >=20
> > Applied this, thanks!
>=20
> Is it possible for bb_size to be both >=3D 2g and valid?

Never be possible in practise and if really that big I think something
is already insane indeed.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--7krksihms4pcky4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCWcLvNgAKCRCxBBozTXgY
J8raAKCfkN8OC6rugdrx38BAww6qxDjKSgCffVPAixLu/B86J/LmiCcQ4JrPkgQ=
=r3Gu
-----END PGP SIGNATURE-----

--7krksihms4pcky4w--
