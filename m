From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Date: Fri, 28 Feb 2020 10:05:11 +0000
Subject: Re: [PATCH] drm/amd/display: Use after free in dmub_psr_destroy()
Message-Id: <cba36257-8562-d14a-da9b-cc38076d350f@daenzer.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
In-Reply-To: <20200228080436.rmsqe3ytmxi3bwxn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Harry Wentland <harry.wentland@amd.com>, Wyatt Wood <wyatt.wood@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>

On 2020-02-28 9:22 a.m., Dan Carpenter wrote:
> These lines need to be re-ordered so that we don't dereference "dmub"
> after we just freed it.
>=20
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR =
in DMCUB")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/=
drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..dc858b152c6e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *c=
tx)
>   */
>  void dmub_psr_destroy(struct dmub_psr **dmub)
>  {
> -	kfree(dmub);
>  	*dmub =3D NULL;
> +	kfree(dmub);
>  }
>=20

Maybe

	kfree(*dmub);

was intended instead?


Actually, this function and others in this file seem completely unused?


--=20
Earthling Michel D=C3=A4nzer               |               https://redhat.c=
om
Libre software enthusiast             |             Mesa and X developer
