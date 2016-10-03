From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 03 Oct 2016 07:18:06 +0000
Subject: Re: [PATCH] drm: Release resources with a safer function
Message-Id: <20161003071806.GS4329@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sun, Oct 02, 2016 at 08:01:22AM +0200, Christophe JAILLET wrote:
> We should use 'ida_simple_remove()' instead of 'ida_remove()' when freeing
> resources allocated with 'ida_simple_get()'.

Should fix drm_connector_cleanup() then as well...

>=20
> This as been spotted with the following coccinelle script which tries to
> detect missing 'ida_simple_remove()' call in error handling paths.
>=20
> ///////////////
> @@
> expression x;
> identifier l;
> @@
>=20
> *   x =3D ida_simple_get(...);
>     ...
>     if (...) {
>     ...
>     }
>     ...
>     if (...) {
>        ...
>        goto l;
>     }
>     ...
> *   l: ... when !=3D ida_simple_remove(...);
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 26bb78c76481..2e7430283043 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -250,10 +250,10 @@ int drm_connector_init(struct drm_device *dev,
>  	connector->debugfs_entry =3D NULL;
>  out_put_type_id:
>  	if (ret)
> -		ida_remove(connector_ida, connector->connector_type_id);
> +		ida_simple_remove(connector_ida, connector->connector_type_id);
>  out_put_id:
>  	if (ret)
> -		ida_remove(&config->connector_ida, connector->index);
> +		ida_simple_remove(&config->connector_ida, connector->index);
>  out_put:
>  	if (ret)
>  		drm_mode_object_unregister(dev, &connector->base);
> --=20
> 2.7.4
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel OTC
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
