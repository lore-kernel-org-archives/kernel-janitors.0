From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 08 Nov 2016 20:38:12 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error handling
Message-Id: <20161108203812.rclbve6wwoupaf4v@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7gag4knqqybfyo7p"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
 <c15282b4-e88a-06b1-527d-96aedce8b7eb@wanadoo.fr>
 <20161102181444.hfrh6fcr2a5oe5n4@lukather>
 <1d4a8fc9-6b62-4af7-19bc-565b15cdc413@wanadoo.fr>
In-Reply-To: <1d4a8fc9-6b62-4af7-19bc-565b15cdc413@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, linux-arm-kernel@lists.infradead.org


--7gag4knqqybfyo7p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Sat, Nov 05, 2016 at 07:15:45AM +0100, Christophe JAILLET wrote:
> Le 02/11/2016 =E0 19:14, Maxime Ripard a =E9crit :
> > Hi,
> >=20
> > On Sun, Oct 30, 2016 at 12:53:02PM +0100, Christophe JAILLET wrote:
> > > BTW, memory allocation in 'sun4i_layers_init()' looks spurious, espec=
ially
> > > the use of 'layer' in the for loop.
> > > Just my 2 cents.
> > What do you mean by it's spurious?
> Hi Maxime,
>=20
> what I mean is:
>=20
> > struct sun4i_layer **sun4i_layers_init(struct drm_device *drm)
> > {
> >     struct sun4i_drv *drv =3D drm->dev_private;
> >     struct sun4i_layer **layers;
> >     int i;
> >
> >     layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun4i_backend_planes),
> >                   sizeof(**layers), GFP_KERNEL);
> Here, we allocate some memory for ARRAY_SIZE(sun4i_backend_planes) (i.e. =
2)
> 'struct sun4i_layer'.
> We do not allocate some space for some pointers but for some structure.
>=20
> Also, these structures are zeroed and seem to never be initialized by
> anything else.
>=20
> >     if (!layers)
> >         return ERR_PTR(-ENOMEM);
> >
> >     /*
> >      * The hardware is a bit unusual here.
> >      *
> >      * Even though it supports 4 layers, it does the composition
> >      * in two separate steps.
> >      *
> >      * The first one is assigning a layer to one of its two
> >      * pipes. If more that 1 layer is assigned to the same pipe,
> >      * and if pixels overlaps, the pipe will take the pixel from
> >      * the layer with the highest priority.
> >      *
> >      * The second step is the actual alpha blending, that takes
> >      * the two pipes as input, and uses the eventual alpha
> >      * component to do the transparency between the two.
> >      *
> >      * This two steps scenario makes us unable to guarantee a
> >      * robust alpha blending between the 4 layers in all
> >      * situations. So we just expose two layers, one per pipe. On
> >      * SoCs that support it, sprites could fill the need for more
> >      * layers.
> >      */
> The comment make me think that this driver (and this function) only handl=
es
> 2 layers ("So we just expose two layers"), which is consistent with
> ARRAY_SIZE(sun4i_backend_planes) (i.e. 2)
> So I would expect that only 2 'struct sun4i_layer' to be allcoated
>=20
> >     for (i =3D 0; i < ARRAY_SIZE(sun4i_backend_planes); i++) {
> >         const struct sun4i_plane_desc *plane =3D &sun4i_backend_planes[=
i];
> >         struct sun4i_layer *layer =3D layers[i];
> Here, we take the address of one of the 2 structure allocated above.
> This is overridden, just the line after.
>=20
> >
> >         layer =3D sun4i_layer_init_one(drm, plane);
> 'sun4i_layer_init_one()' looks() like:
>=20
>     struct sun4i_layer *layer;
>     layer =3D devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
>     ...
>     return layer;
>=20
> So we once more allocate some 'struct sun4i_layer'
>=20
> BUT, the corresponding address is stored into the 'layer' variable, and
> finally seems to get lost and no reference is kept of this. (i.e. 'layers'
> (with an s) is left unchanged)
>=20
> >         if (IS_ERR(layer)) {
> >             dev_err(drm->dev, "Couldn't initialize %s plane\n",
> >                 i ? "overlay" : "primary");
> >             return ERR_CAST(layer);
> >         };
> >
> >         DRM_DEBUG_DRIVER("Assigning %s plane to pipe %d\n",
> >                  i ? "overlay" : "primary", plane->pipe);
> >         regmap_update_bits(drv->backend->regs,
> SUN4I_BACKEND_ATTCTL_REG0(i),
> >                    SUN4I_BACKEND_ATTCTL_REG0_LAY_PIPESEL_MASK,
> > SUN4I_BACKEND_ATTCTL_REG0_LAY_PIPESEL(plane->pipe));
> >
> >         layer->id =3D i;
> >     };
> >
> >     return layers;
> > }
>=20
>=20
> So, 4 'struct sun4i_layer' have been allocated. 2 in 'sun4i_layers_init()'
> and 2 in 'sun4i_layer_init_one()' (once at a time, but called twice)
>=20
> What looks spurious to me is either:
>    - 'struct sun4i_layer *layer =3D layers[i];' which should just be 'str=
uct
> sun4i_layer *layer;'
> or
>    - 'layers' (with an s) should be an array of pointers and the addresses
> returned by 'sun4i_layer_init_one()' should be saved there.
>=20
>=20
> I don't know at all this driver, so I'm maybe completely wrong.
> What I would have expected would be something like: (un-tested, just to g=
ive
> an idea)
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D8<=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> @@ -133,9 +133,9 @@ struct sun4i_layer **sun4i_layers_init(struct drm_dev=
ice
> *drm)
>      struct sun4i_layer **layers;
>      int i;
>=20
>      layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun4i_backend_planes),
> -                  sizeof(**layers), GFP_KERNEL);
> +                  sizeof(*layers), GFP_KERNEL);
>      if (!layers)
>          return ERR_PTR(-ENOMEM);
>=20
>      /*
> @@ -160,16 +160,17 @@ struct sun4i_layer **sun4i_layers_init(struct
> drm_device *drm)
>       * layers.
>       */
>      for (i =3D 0; i < ARRAY_SIZE(sun4i_backend_planes); i++) {
>          const struct sun4i_plane_desc *plane =3D &sun4i_backend_planes[i=
];
> -        struct sun4i_layer *layer =3D layers[i];
> +        struct sun4i_layer *layer;
>=20
>          layer =3D sun4i_layer_init_one(drm, plane);
>          if (IS_ERR(layer)) {
>              dev_err(drm->dev, "Couldn't initialize %s plane\n",
>                  i ? "overlay" : "primary");
>              return ERR_CAST(layer);
>          };
> +        layers[i] =3D layer;
>=20
>          DRM_DEBUG_DRIVER("Assigning %s plane to pipe %d\n",
>                   i ? "overlay" : "primary", plane->pipe);
>          regmap_update_bits(drv->backend->regs,
> SUN4I_BACKEND_ATTCTL_REG0(i),

You're totally right. Can you send this as a formal patch?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7gag4knqqybfyo7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIjeoAAoJEBx+YmzsjxAgxugP/RMJG/Up/ShR83/URZ/n6eor
AgG8FCuX22YDSQHT8deVkl79/BpFaC3wiD9HVEh5Z2AoKUb6dz5I6Ua7V3DRHe51
4SJB05za0ROB3WbVBOCkDYqteoyeE0s3Bq+M/GYM+95s7liCcnieij1OWC6IeeDC
H5X2Ww5vaKiZJ/cAF35QHBXbnLmx8E5QeYa97Qo7yO2vrOoZbubaDmXwVGYbB5gc
oxYchEPhwlYLPewk4NV7fozZddA0z7kwRB/10+b/hLhRUUrdyhmKf/TVtt9EkyWL
WrzXAFztm6PuicNFbMfALaFLSus8NzoEXF8Vjdw+GTmTmQzlWyX1qoODRsqWniLL
k46igvjQAofYLjtFCRITomCFGjGgCT+wsLXjtUZgB5BN8kWZq/84Fwy2oXlgP21M
Bmgm2BA76ci+pFjD5FvC0maC1OXYRJUQxh0vX/GJXx9WJsmp4rc2DNXXZMe0GrNQ
0l2h00KgJNjD0pG64M4NjFEEFVp+sve6yfrN8Y/P4r/kg0zr65kCLLuhshhZwI+K
LkCS2LXmcruAy+JoaDn9f08GvLfWQtnjV6ggAnC6enbs0MAT8zVwW1Cl8PgshBuO
6DMYvuxSiZ+qIxF4622tQbpxRnMXh3WXAJRFyQlQ+q6jM1Wr7gn1xFytZoHLrgBF
Ldv1udlrWL+nwDhqBZR2
=vTW6
-----END PGP SIGNATURE-----

--7gag4knqqybfyo7p--
