From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 14:44:29 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <20170207144429.GM11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131630.GA28207@mwanda>
 <1486478097.3121.120.camel@linux.intel.com>
In-Reply-To: <1486478097.3121.120.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Jike Song <jike.song@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

On Tue, Feb 07, 2017 at 04:34:57PM +0200, Joonas Lahtinen wrote:
> On ti, 2017-02-07 at 16:16 +0300, Dan Carpenter wrote:
> > If "caps.buf" is already NULL then it doesn't need to be freed or set to
> > NULL.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> <SNIP>
>=20
> > @@ -965,11 +965,8 @@ static long intel_vgpu_ioctl(struct mdev_device *m=
dev, unsigned int cmd,
> > =A0			sparse->areas[0].offset > > =A0					PAGE_ALIGN(vgpu_aperture_offs=
et(vgpu));
> > =A0			sparse->areas[0].size =3D vgpu_aperture_sz(vgpu);
> > -			if (!caps.buf) {
>=20
> Looking at the code around, the right thing would be to just remove the
> negation? This currently seems like a memory leak.
>=20
> > -				kfree(caps.buf);
> > -				caps.buf =3D NULL;
> > +			if (!caps.buf)
> > =A0				caps.size =3D 0;
> > -			}
>=20
> And quickly looking, the caps is pre-initialized but unused at this
> point, so the whole if could just be removed, right?

Hm...  Duh.  You're right.  Let me resend.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
