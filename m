From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 21 Oct 2016 12:27:46 +0000
Subject: Re: [patch] drm/i915/gvt: cleanup a type issue in submit_context()
Message-Id: <20161021122746.djrntsnres6dvi56@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ezhblxxfw5tz2ydl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161021080601.GA28738@elgon.mountain>
 <20161021082738.2va437v2qzsf7inq@zhen-hp.sh.intel.com>
 <20161021102722.GT4469@mwanda>
In-Reply-To: <20161021102722.GT4469@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Zhi Wang <zhi.a.wang@intel.com>, Yulei Zhang <yulei.zhang@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org


--ezhblxxfw5tz2ydl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2016.10.21 13:27:22 +0300, Dan Carpenter wrote:
> On Fri, Oct 21, 2016 at 04:27:38PM +0800, Zhenyu Wang wrote:
> > On 2016.10.21 11:06:01 +0300, Dan Carpenter wrote:
> > > submit_context() should return negative error codes and zero on succe=
ss
> > > but by mistake we made it a bool.  I've changed it to int.  Also I ma=
de
> > > it static because this isn't referenced in any other files.
> > >=20
> > > This doesn't affect runtime because the return is eventually propogat=
ed
> > > to elsp_mmio_write() where it is ignored.
> > >=20
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i9=
15/gvt/execlist.c
> > > index c50a3d1a5131..bc69ba1842ea 100644
> > > --- a/drivers/gpu/drm/i915/gvt/execlist.c
> > > +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> > > @@ -616,7 +616,7 @@ static int prepare_mm(struct intel_vgpu_workload =
*workload)
> > >  	(list_empty(q) ? NULL : container_of(q->prev, \
> > >  	struct intel_vgpu_workload, list))
> > > =20
> > > -bool submit_context(struct intel_vgpu *vgpu, int ring_id,
> > > +static int submit_context(struct intel_vgpu *vgpu, int ring_id,
> > >  		struct execlist_ctx_descriptor_format *desc,
> > >  		bool emulate_schedule_in)
> > >  {
> >=20
> > Dan, this has been fixed in our recent pull, should hit linux-next very=
 soon.
> >=20
>=20
> Could you review elsp_mmio_write() as well?  Should we be doing
> something with that return value?
>=20

yeah, ignore return value is not good, will fix that. Thanks!

Zhi, could you double check error path for elsp write?

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ezhblxxfw5tz2ydl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEABECAAYFAlgKCb0ACgkQsQQaM014GCdWawCfRiOCu+QY9XmACO21/G5tPR4u
LkQAn36s61AX2nSCraO2qViU7R1oh+KM
=I2Hs
-----END PGP SIGNATURE-----

--ezhblxxfw5tz2ydl--
