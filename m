From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 25 Feb 2017 08:01:19 +0000
Subject: Re: [PATCH] [media] exynos4-is: Add missing 'of_node_put'
Message-Id: <c3c046ca-4f03-5023-83b9-353351a7696f@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170123211656.11185-1-christophe.jaillet@wanadoo.fr>
 <2357ef6e-8d90-77d0-0399-21fec41389a1@osg.samsung.com>
In-Reply-To: <2357ef6e-8d90-77d0-0399-21fec41389a1@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Le 24/02/2017 =E0 22:19, Javier Martinez Canillas a =E9crit :
> Thanks for the patch, but Krzysztof sent the exact same patch before=20
> [0]. There
> was feedback from Sylwester at the time that you can also look at [0]. Co=
uld you
> please take that into account and post a patch according to what he sugge=
sted?
>
> [0]: http://lists.infradead.org/pipermail/linux-arm-kernel/2016-March/415=
207.html
>
> Best regards,

Hi,

apparently, the patch has already been taken into -next by Mauro=20
Carvalho Chehab.

Moreover, I personally don't think that what is proposed in [0] is more=20
readable.
There is not that much code between 'of_get_next_child' and=20
'of_node_put' in the normal path and not so many error handling paths=20
between the 2 function calls.
Adding some indentation level is not an improvement, IMHO.

If you really want, I could propose something like the code below (not=20
carefully checked, just to give an idea), but honestly, I don't think it=20
is needed.
It avoids some new indent and avoids duplicating 'of_node_put'.

Tell me if you think it is an improvement and I'll send a patch.

CJ


diff --git a/drivers/media/platform/exynos4-is/media-dev.c=20
b/drivers/media/platform/exynos4-is/media-dev.c
index e3a8709138fa..da5b76c1df98 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -385,38 +385,35 @@ static void fimc_md_pipelines_free(struct fimc_md=20
*fmd)
  static int fimc_md_parse_port_node(struct fimc_md *fmd,
                     struct device_node *port,
                     unsigned int index)
  {
      struct fimc_source_info *pd =3D &fmd->sensor[index].pdata;
-    struct device_node *rem, *ep, *np;
+    struct device_node *rem =3D NULL, *ep =3D NULL, *np;
      struct v4l2_of_endpoint endpoint;
      int ret;

      /* Assume here a port node can have only one endpoint node. */
      ep =3D of_get_next_child(port, NULL);
      if (!ep)
          return 0;

      ret =3D v4l2_of_parse_endpoint(ep, &endpoint);
-    if (ret) {
-        of_node_put(ep);
-        return ret;
-    }
+    if (ret)
+        goto put_ep;

      if (WARN_ON(endpoint.base.port =3D 0) || index >=3D FIMC_MAX_SENSORS)=
 {
-        of_node_put(ep);
-        return -EINVAL;
+        ret =3D -EINVAL;
+        goto put_ep;
      }

      pd->mux_id =3D (endpoint.base.port - 1) & 0x1;

      rem =3D of_graph_get_remote_port_parent(ep);
-    of_node_put(ep);
      if (rem =3D NULL) {
          v4l2_info(&fmd->v4l2_dev, "Remote device at %s not found\n",
                              ep->full_name);
-        return 0;
+        goto out;
      }

      if (fimc_input_is_parallel(endpoint.base.port)) {
          if (endpoint.bus_type =3D V4L2_MBUS_PARALLEL)
              pd->sensor_bus_type =3D FIMC_BUS_TYPE_ITU_601;
@@ -447,22 +444,28 @@ static int fimc_md_parse_port_node(struct fimc_md=20
*fmd,
          pd->fimc_bus_type =3D FIMC_BUS_TYPE_ISP_WRITEBACK;
      else
          pd->fimc_bus_type =3D pd->sensor_bus_type;

      if (WARN_ON(index >=3D ARRAY_SIZE(fmd->sensor))) {
-        of_node_put(rem);
-        return -EINVAL;
+        ret =3D -EINVAL;
+        goto put_rem;
      }

      fmd->sensor[index].asd.match_type =3D V4L2_ASYNC_MATCH_OF;
      fmd->sensor[index].asd.match.of.node =3D rem;
      fmd->async_subdevs[index] =3D &fmd->sensor[index].asd;

      fmd->num_sensors++;
+out:
+    ret =3D 0;

+put_rem:
      of_node_put(rem);
-    return 0;
+
+put_ep:
+    of_node_put(ep);
+    return ret;
  }

  /* Register all SoC external sub-devices */
  static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
  {


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
