From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:53:52 +0000
Subject: Re: [PATCH 03/16] drm: radeon: fix sparse warnings: Using plain
Message-Id: <154e089b0902261653q4576b9c6v20b456834e4fac3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000122.17557.75097.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000122.17557.75097.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, dri-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:01 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0drivers/gpu/drm/radeon/radeon_cp.c:1363:52: warning: Using plain integ=
er as NULL pointer
> =A0drivers/gpu/drm/radeon/radeon_state.c:1983:61: warning: Using plain in=
teger as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/gpu/drm/radeon/radeon_cp.c =A0 =A0| =A0 =A02 +-
> =A0drivers/gpu/drm/radeon/radeon_state.c | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cp.c b/drivers/gpu/drm/radeon/=
radeon_cp.c
> index 119e642..f5f4e96 100644
> --- a/drivers/gpu/drm/radeon/radeon_cp.c
> +++ b/drivers/gpu/drm/radeon/radeon_cp.c
> @@ -1360,7 +1360,7 @@ static int radeon_do_cleanup_cp(struct drm_device *=
 dev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (dev_priv->gart_info.gart_table_locatio=
n =3D DRM_ATI_GART_FB)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0drm_core_ioremapfree(&dev_=
priv->gart_info.mapping, dev);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->gart_info.addr =
=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->gart_info.addr =
=3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0/* only clear to the start of flags */
> diff --git a/drivers/gpu/drm/radeon/radeon_state.c b/drivers/gpu/drm/rade=
on/radeon_state.c
> index 043293a..61e75bc 100644
> --- a/drivers/gpu/drm/radeon/radeon_state.c
> +++ b/drivers/gpu/drm/radeon/radeon_state.c
> @@ -1980,7 +1980,7 @@ static int alloc_surface(drm_radeon_surface_alloc_t=
 *new,
>
> =A0 =A0 =A0 =A0/* find a virtual surface */
> =A0 =A0 =A0 =A0for (i =3D 0; i < 2 * RADEON_MAX_SURFACES; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev_priv->virt_surfaces[i].file_priv =
=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev_priv->virt_surfaces[i].file_priv =
=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0if (i =3D 2 * RADEON_MAX_SURFACES) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
