From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 14:31:29 +0000
Subject: Re: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <20200714143129.GX2549@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714141216.GA314989@mwanda>
 <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
In-Reply-To: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

On Tue, Jul 14, 2020 at 05:16:33PM +0300, Lionel Landwerlin wrote:
> On 14/07/2020 17:12, Dan Carpenter wrote:
> > The error code is not set on this error path.  It's either zero or
> > uninitialized at this point.
> >=20
> > Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored ac=
ross noa_wait")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/d=
rm/i915/selftests/i915_perf.c
> > index deb6dec1b5ab..7aa73bb03381 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > @@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
> >   	cs =3D intel_ring_begin(rq, 2 * 32 + 2);
> >   	if (IS_ERR(cs)) {
> >   		i915_request_add(rq);
> > +		err =3D PTR_ERR(cs);
> >   		goto out_rq;
> >   	}
>=20
> Looks like there is another below :
>=20
> cs =3D intel_ring_begin(rq, 4);
> if (IS_ERR(cs)) {
> =A0=A0=A0=A0=A0=A0=A0 i915_request_add(rq);
> =A0=A0=A0=A0=A0=A0=A0 goto out_rq;
> }

Oh...  Hm...  I'm looking at linux-next now and you're right.  Also
Colin already fixed the return that I fixed.  I'll resend.

regards,
dan carpenter
