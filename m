From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 05 Nov 2016 06:15:45 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error handling
Message-Id: <1d4a8fc9-6b62-4af7-19bc-565b15cdc413@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
 <c15282b4-e88a-06b1-527d-96aedce8b7eb@wanadoo.fr>
 <20161102181444.hfrh6fcr2a5oe5n4@lukather>
In-Reply-To: <20161102181444.hfrh6fcr2a5oe5n4@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: airlied@linux.ie, wens@csie.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 02/11/2016 =E0 19:14, Maxime Ripard a =E9crit :
> Hi,
>
> On Sun, Oct 30, 2016 at 12:53:02PM +0100, Christophe JAILLET wrote:
>> BTW, memory allocation in 'sun4i_layers_init()' looks spurious, especial=
ly
>> the use of 'layer' in the for loop.
>> Just my 2 cents.
> What do you mean by it's spurious?
Hi Maxime,

what I mean is:

 > struct sun4i_layer **sun4i_layers_init(struct drm_device *drm)
 > {
 >     struct sun4i_drv *drv =3D drm->dev_private;
 >     struct sun4i_layer **layers;
 >     int i;
 >
 >     layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun4i_backend_planes),
 >                   sizeof(**layers), GFP_KERNEL);
Here, we allocate some memory for ARRAY_SIZE(sun4i_backend_planes) (i.e.=20
2) 'struct sun4i_layer'.
We do not allocate some space for some pointers but for some structure.

Also, these structures are zeroed and seem to never be initialized by=20
anything else.

 >     if (!layers)
 >         return ERR_PTR(-ENOMEM);
 >
 >     /*
 >      * The hardware is a bit unusual here.
 >      *
 >      * Even though it supports 4 layers, it does the composition
 >      * in two separate steps.
 >      *
 >      * The first one is assigning a layer to one of its two
 >      * pipes. If more that 1 layer is assigned to the same pipe,
 >      * and if pixels overlaps, the pipe will take the pixel from
 >      * the layer with the highest priority.
 >      *
 >      * The second step is the actual alpha blending, that takes
 >      * the two pipes as input, and uses the eventual alpha
 >      * component to do the transparency between the two.
 >      *
 >      * This two steps scenario makes us unable to guarantee a
 >      * robust alpha blending between the 4 layers in all
 >      * situations. So we just expose two layers, one per pipe. On
 >      * SoCs that support it, sprites could fill the need for more
 >      * layers.
 >      */
The comment make me think that this driver (and this function) only=20
handles 2 layers ("So we just expose two layers"), which is consistent=20
with ARRAY_SIZE(sun4i_backend_planes) (i.e. 2)
So I would expect that only 2 'struct sun4i_layer' to be allcoated

 >     for (i =3D 0; i < ARRAY_SIZE(sun4i_backend_planes); i++) {
 >         const struct sun4i_plane_desc *plane =3D &sun4i_backend_planes[i=
];
 >         struct sun4i_layer *layer =3D layers[i];
Here, we take the address of one of the 2 structure allocated above.
This is overridden, just the line after.

 >
 >         layer =3D sun4i_layer_init_one(drm, plane);
'sun4i_layer_init_one()' looks() like:

     struct sun4i_layer *layer;
     layer =3D devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
     ...
     return layer;

So we once more allocate some 'struct sun4i_layer'

BUT, the corresponding address is stored into the 'layer' variable, and=20
finally seems to get lost and no reference is kept of this. (i.e.=20
'layers' (with an s) is left unchanged)

 >         if (IS_ERR(layer)) {
 >             dev_err(drm->dev, "Couldn't initialize %s plane\n",
 >                 i ? "overlay" : "primary");
 >             return ERR_CAST(layer);
 >         };
 >
 >         DRM_DEBUG_DRIVER("Assigning %s plane to pipe %d\n",
 >                  i ? "overlay" : "primary", plane->pipe);
 >         regmap_update_bits(drv->backend->regs,=20
SUN4I_BACKEND_ATTCTL_REG0(i),
 >                    SUN4I_BACKEND_ATTCTL_REG0_LAY_PIPESEL_MASK,
 > SUN4I_BACKEND_ATTCTL_REG0_LAY_PIPESEL(plane->pipe));
 >
 >         layer->id =3D i;
 >     };
 >
 >     return layers;
 > }


So, 4 'struct sun4i_layer' have been allocated. 2 in=20
'sun4i_layers_init()' and 2 in 'sun4i_layer_init_one()' (once at a time,=20
but called twice)

What looks spurious to me is either:
    - 'struct sun4i_layer *layer =3D layers[i];' which should just be=20
'struct sun4i_layer *layer;'
or
    - 'layers' (with an s) should be an array of pointers and the=20
addresses returned by 'sun4i_layer_init_one()' should be saved there.


I don't know at all this driver, so I'm maybe completely wrong.
What I would have expected would be something like: (un-tested, just to=20
give an idea)


=3D=3D=3D=3D=3D=3D=3D8<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

@@ -133,9 +133,9 @@ struct sun4i_layer **sun4i_layers_init(struct=20
drm_device *drm)
      struct sun4i_layer **layers;
      int i;

      layers =3D devm_kcalloc(drm->dev, ARRAY_SIZE(sun4i_backend_planes),
-                  sizeof(**layers), GFP_KERNEL);
+                  sizeof(*layers), GFP_KERNEL);
      if (!layers)
          return ERR_PTR(-ENOMEM);

      /*
@@ -160,16 +160,17 @@ struct sun4i_layer **sun4i_layers_init(struct=20
drm_device *drm)
       * layers.
       */
      for (i =3D 0; i < ARRAY_SIZE(sun4i_backend_planes); i++) {
          const struct sun4i_plane_desc *plane =3D &sun4i_backend_planes[i];
-        struct sun4i_layer *layer =3D layers[i];
+        struct sun4i_layer *layer;

          layer =3D sun4i_layer_init_one(drm, plane);
          if (IS_ERR(layer)) {
              dev_err(drm->dev, "Couldn't initialize %s plane\n",
                  i ? "overlay" : "primary");
              return ERR_CAST(layer);
          };
+        layers[i] =3D layer;

          DRM_DEBUG_DRIVER("Assigning %s plane to pipe %d\n",
                   i ? "overlay" : "primary", plane->pipe);
          regmap_update_bits(drv->backend->regs,=20
SUN4I_BACKEND_ATTCTL_REG0(i),


Best regards,
CJ
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
