From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 10:18:47 +0000
Subject: Re: [PATCH] drm/amd/display: Use after free in dmub_psr_destroy()
Message-Id: <20200228101847.GB4118@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
 <cba36257-8562-d14a-da9b-cc38076d350f@daenzer.net>
In-Reply-To: <cba36257-8562-d14a-da9b-cc38076d350f@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>

On Fri, Feb 28, 2020 at 11:05:11AM +0100, Michel D=E4nzer wrote:
> On 2020-02-28 9:22 a.m., Dan Carpenter wrote:
> > These lines need to be re-ordered so that we don't dereference "dmub"
> > after we just freed it.
> >=20
> > Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PS=
R in DMCUB")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gp=
u/drm/amd/display/dc/dce/dmub_psr.c
> > index 2c932c29f1f9..dc858b152c6e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> > @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context =
*ctx)
> >   */
> >  void dmub_psr_destroy(struct dmub_psr **dmub)
> >  {
> > -	kfree(dmub);
> >  	*dmub =3D NULL;
> > +	kfree(dmub);
> >  }
> >=20
>=20
> Maybe
>=20
> 	kfree(*dmub);
>=20
> was intended instead?
>=20

Ah yeah.  You're right.  I will resend.

>=20
> Actually, this function and others in this file seem completely unused?

It's used in linux-next from dcn21_resource_destruct().

drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
   986 =20
   987          if (pool->base.dp_clock_source !=3D NULL) {
   988                  dcn20_clock_source_destroy(&pool->base.dp_clock_sou=
rce);
   989                  pool->base.dp_clock_source =3D NULL;
   990          }
   991 =20
   992 =20
   993          if (pool->base.abm !=3D NULL)
   994                  dce_abm_destroy(&pool->base.abm);
   995 =20
   996          if (pool->base.dmcu !=3D NULL)
   997                  dce_dmcu_destroy(&pool->base.dmcu);
   998 =20
   999          if (pool->base.psr !=3D NULL)
  1000                  dmub_psr_destroy(&pool->base.psr);

kfree(&pool->base.psr); will crash.

  1001 =20
  1002          if (pool->base.dccg !=3D NULL)
  1003                  dcn_dccg_destroy(&pool->base.dccg);
  1004 =20
  1005          if (pool->base.pp_smu !=3D NULL)
  1006                  dcn21_pp_smu_destroy(&pool->base.pp_smu);
  1007  }


regards,
dan carpenter
