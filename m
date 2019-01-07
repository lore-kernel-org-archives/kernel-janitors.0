From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 07 Jan 2019 10:00:49 +0000
Subject: Re: [PATCH] drm/etnaviv: fix some off by one bugs
Message-Id: <20190107100049.GX21184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145631.qxd3pzk72v4bshii@kili.mountain>
 <20181221202406.GF2240@kadam>
 <CAKMK7uFfNch70k5O+OmqMpDsO7V1ADiF1Yo4Vv+K5eDSR9L0mA@mail.gmail.com>
 <1546850520.3580.1.camel@pengutronix.de>
In-Reply-To: <1546850520.3580.1.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lucas Stach <l.stach@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>, Dan Carpenter <dan.carpenter@oracle.com>

On Mon, Jan 07, 2019 at 09:42:00AM +0100, Lucas Stach wrote:
> Hi Daniel,
>=20
> Am Montag, den 24.12.2018, 10:32 +0100 schrieb Daniel Vetter:
> > On Fri, Dec 21, 2018 at 9:24 PM Dan Carpenter <dan.carpenter@oracle.c
> > om> wrote:
> > >=20
> > > I don't think anyone responded to this one?
> >=20
> > Maybe time to move etnaviv into drm-misc so that there's a notch more
> > redundancy in maintainers? Lucas, Christian, others?
>=20
> Sorry, but no thanks. The current model guarantees that we have at
> least some testing of the patches flowing through the etnaviv tree with
> realworld use-cases. We certainly don't have the resources to track a
> rapidly changing target like drm-misc with our testing.

Not following here exactly, whether you do your own tree or reuse some
existing infrastructure, upstream moves as fast as it does no matter how
things work. And you can still do all the usual testing before pushing.

And I just brought this up because the separate tree also doesn't seem to
be entirely perfectly managed either. You wouldn't get me nagging if
the etnaviv pull wouldn't have raised questions :-)
-Daniel

> Regards,
> Lucas
>=20
> > -Daniel
> >=20
> > >=20
> > > regards,
> > > dan carpenter
> > >=20
> > > On Fri, Jul 13, 2018 at 06:00:18PM +0300, Dan Carpenter wrote:
> > > > The ->nr_signal is the supposed to be the number of elements in
> > > > the
> > > > ->signal array.=A0=A0There was one place where it was 5 but it was
> > > > supposed
> > > > to be 4.=A0=A0That looks like a copy and paste bug.=A0=A0There were=
 also
> > > > two
> > > > checks that were off by one.
> > > >=20
> > > > Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query
> > > > perf counter")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > Not tested.
> > > >=20
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > > b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > > index 9980d81a26e3..4227a4006c34 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > > > @@ -113,7 +113,7 @@ static const struct etnaviv_pm_domain
> > > > doms_3d[] =3D {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.name =3D "PE",
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.profile_read =3D VIVS_MC=
_PROFILE_PE_READ,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.profile_config =3D VIVS_=
MC_PROFILE_CONFIG0,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.nr_signals =3D 5,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.nr_signals =3D 4,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.signal =3D (const struct=
 etnaviv_pm_signal[]) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0"PIXEL_COUNT_KILLED_BY_COLOR_PIPE",
> > > > @@ -435,7 +435,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu
> > > > *gpu,
> > > >=20
> > > > =A0=A0=A0=A0=A0=A0dom =3D meta->domains + signal->domain;
> > > >=20
> > > > -=A0=A0=A0=A0=A0if (signal->iter > dom->nr_signals)
> > > > +=A0=A0=A0=A0=A0if (signal->iter >=3D dom->nr_signals)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > >=20
> > > > =A0=A0=A0=A0=A0=A0sig =3D &dom->signal[signal->iter];
> > > > @@ -461,7 +461,7 @@ int etnaviv_pm_req_validate(const struct
> > > > drm_etnaviv_gem_submit_pmr *r,
> > > >=20
> > > > =A0=A0=A0=A0=A0=A0dom =3D meta->domains + r->domain;
> > > >=20
> > > > -=A0=A0=A0=A0=A0if (r->signal > dom->nr_signals)
> > > > +=A0=A0=A0=A0=A0if (r->signal >=3D dom->nr_signals)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > >=20
> > > > =A0=A0=A0=A0=A0=A0return 0;
> > >=20
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >=20
> >=20
> >=20

--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
