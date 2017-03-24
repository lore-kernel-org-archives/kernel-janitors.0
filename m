From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 24 Mar 2017 03:38:04 +0000
Subject: Re: [PATCH] drm/i915/kvmgt: avoid dereferencing a potentially null info pointer
Message-Id: <20170324033804.i7nxafpwvhm7fm5j@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="aqhqw6pegnz5ogk4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323122230.19064-1-colin.king@canonical.com>
 <CAH6sp9PYkq_PTx9x86+xaw+azZOSQr7DkrDW_M6+_3yDf2KzWA@mail.gmail.com>
In-Reply-To: <CAH6sp9PYkq_PTx9x86+xaw+azZOSQr7DkrDW_M6+_3yDf2KzWA@mail.gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "Zhang,
 Tina" <tina.zhang@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Colin King <colin.king@canonical.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>


--aqhqw6pegnz5ogk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.03.23 14:43:44 +0100, Frans Klaver wrote:
> On Thu, Mar 23, 2017 at 1:22 PM, Colin King <colin.king@canonical.com> wr=
ote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > info is being checked to see if it is a null pointer, however, vpgu is
> > dereferencing info before this check, leading to a potential null
> > pointer dereference.  If info is null, then the error message being
> > printed by macro gvt_vgpu_err and this requires vpgu to exist. We can
> > use a null vpgu as the macro has a sanity check to see if vpgu is null,
> > so this is OK.
> >
> > Detected with CoverityScan, CID#1420672 ("Dereference nefore null check=
")
>=20
> s,nefore,before,
>=20
>=20
> >
> > Fixes: 695fbc08d80f ("drm/i915/gvt: replace the gvt_err with gvt_vgpu_e=
rr")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gv=
t/kvmgt.c
> > index 1ea3eb270de8..f8619a772c44 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -1339,9 +1339,9 @@ static int kvmgt_guest_init(struct mdev_device *m=
dev)
> >
> >  static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
> >  {
> > -       struct intel_vgpu *vgpu =3D info->vgpu;
> > -
> >         if (!info) {
> > +               struct intel_vgpu *vgpu =3D NULL;
> > +
> >                 gvt_vgpu_err("kvmgt_guest_info invalid\n");
> >                 return false;
> >         }
>=20
> Does this mean the original gvt_err() macro is no longer there?
>=20
> And apparently gvt_vgpu_err is a macro that depends on the specifics
> of its environment? Yikes.
>=20

The null check is redundant there, we can just remove that block and extra
vgpu variable.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--aqhqw6pegnz5ogk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAljUlJwACgkQsQQaM014GCfh8QCbBphbd2I9GtgXCwMTyP1+0h5G
+FEAoJq5zLfSpKABcn4GkApnXm5uV6FF
=Z9zn
-----END PGP SIGNATURE-----

--aqhqw6pegnz5ogk4--
