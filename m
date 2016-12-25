From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:33:44 +0000
Subject: [PATCH 04/19] [media] uvc_driver: Adjust 28 checks for null pointers
Message-Id: <8adac30a-d655-0e85-e80d-831ab10694a3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 09:40:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_driver.c | 54 +++++++++++++++++++---------------=
----
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc=
_driver.c
index bddaf98ef828..32d39404c1cb 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -254,7 +254,7 @@ void uvc_simplify_fraction(uint32_t *numerator, uint32_=
t *denominator,
 	unsigned int i, n;
=20
 	an =3D kmalloc_array(n_terms, sizeof(*an), GFP_KERNEL);
-	if (an =3D NULL)
+	if (!an)
 		return;
=20
 	/* Convert the fraction to a simple continued fraction. See
@@ -340,7 +340,7 @@ static struct uvc_entity *uvc_entity_by_reference(struc=
t uvc_device *dev,
 {
 	unsigned int i;
=20
-	if (entity =3D NULL)
+	if (!entity)
 		entity =3D list_entry(&dev->entities, struct uvc_entity, list);
=20
 	list_for_each_entry_continue(entity, &dev->entities, list) {
@@ -400,7 +400,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 		/* Find the format descriptor from its GUID. */
 		fmtdesc =3D uvc_format_by_guid(&buffer[5]);
=20
-		if (fmtdesc !=3D NULL) {
+		if (fmtdesc) {
 			strlcpy(format->name, fmtdesc->name,
 				sizeof format->name);
 			format->fcc =3D fmtdesc->fcc;
@@ -661,7 +661,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	}
=20
 	streaming =3D kzalloc(sizeof *streaming, GFP_KERNEL);
-	if (streaming =3D NULL) {
+	if (!streaming) {
 		usb_driver_release_interface(&uvc_driver.driver, intf);
 		return -EINVAL;
 	}
@@ -749,7 +749,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
=20
 	streaming->header.bmaControls =3D kmemdup(&buffer[size], p * n,
 						GFP_KERNEL);
-	if (streaming->header.bmaControls =3D NULL) {
+	if (!streaming->header.bmaControls) {
 		ret =3D -ENOMEM;
 		goto error;
 	}
@@ -815,7 +815,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	size =3D nformats * sizeof *format + nframes * sizeof *frame
 	     + nintervals * sizeof *interval;
 	format =3D kzalloc(size, GFP_KERNEL);
-	if (format =3D NULL) {
+	if (!format) {
 		ret =3D -ENOMEM;
 		goto error;
 	}
@@ -867,7 +867,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 		alts =3D &intf->altsetting[i];
 		ep =3D uvc_find_endpoint(alts,
 				streaming->header.bEndpointAddress);
-		if (ep =3D NULL)
+		if (!ep)
 			continue;
=20
 		psize =3D le16_to_cpu(ep->desc.wMaxPacketSize);
@@ -901,7 +901,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8=
 id,
 	size =3D sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
 	     + num_inputs;
 	entity =3D kzalloc(size, GFP_KERNEL);
-	if (entity =3D NULL)
+	if (!entity)
 		return NULL;
=20
 	entity->id =3D id;
@@ -975,7 +975,7 @@ static int uvc_parse_vendor_control(struct uvc_device *=
dev,
=20
 		unit =3D uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
 					p + 1, 2*n);
-		if (unit =3D NULL)
+		if (!unit)
 			return -ENOMEM;
=20
 		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
@@ -1028,7 +1028,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
 		/* Parse all USB Video Streaming interfaces. */
 		for (i =3D 0; i < n; ++i) {
 			intf =3D usb_ifnum_to_if(udev, buffer[12+i]);
-			if (intf =3D NULL) {
+			if (!intf) {
 				uvc_trace(UVC_TRACE_DESCR,
 					  "device %d interface %d doesn't exists\n",
 					  udev->devnum, i);
@@ -1084,7 +1084,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
=20
 		term =3D uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
 					1, n + p);
-		if (term =3D NULL)
+		if (!term)
 			return -ENOMEM;
=20
 		if (UVC_ENTITY_TYPE(term) =3D UVC_ITT_CAMERA) {
@@ -1145,7 +1145,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
=20
 		term =3D uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
 					1, 0);
-		if (term =3D NULL)
+		if (!term)
 			return -ENOMEM;
=20
 		memcpy(term->baSourceID, &buffer[7], 1);
@@ -1170,7 +1170,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
 		}
=20
 		unit =3D uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
-		if (unit =3D NULL)
+		if (!unit)
 			return -ENOMEM;
=20
 		memcpy(unit->baSourceID, &buffer[5], p);
@@ -1196,7 +1196,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
 		}
=20
 		unit =3D uvc_alloc_entity(buffer[2], buffer[3], 2, n);
-		if (unit =3D NULL)
+		if (!unit)
 			return -ENOMEM;
=20
 		memcpy(unit->baSourceID, &buffer[4], 1);
@@ -1229,7 +1229,7 @@ static int uvc_parse_standard_control(struct uvc_devi=
ce *dev,
 		}
=20
 		unit =3D uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
-		if (unit =3D NULL)
+		if (!unit)
 			return -ENOMEM;
=20
 		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
@@ -1358,7 +1358,7 @@ static int uvc_scan_chain_entity(struct uvc_video_cha=
in *chain,
 		if (uvc_trace_param & UVC_TRACE_PROBE)
 			printk(KERN_CONT " <- PU %d", entity->id);
=20
-		if (chain->processing !=3D NULL) {
+		if (chain->processing) {
 			uvc_trace(UVC_TRACE_DESCR,
 				  "Found multiple Processing Units in chain.\n");
 			return -1;
@@ -1375,7 +1375,7 @@ static int uvc_scan_chain_entity(struct uvc_video_cha=
in *chain,
 		if (entity->bNrInPins =3D 1)
 			break;
=20
-		if (chain->selector !=3D NULL) {
+		if (chain->selector) {
 			uvc_trace(UVC_TRACE_DESCR,
 				  "Found multiple Selector Units in chain.\n");
 			return -1;
@@ -1435,7 +1435,7 @@ static int uvc_scan_chain_forward(struct uvc_video_ch=
ain *chain,
 	while (1) {
 		forward =3D uvc_entity_by_reference(chain->dev, entity->id,
 			forward);
-		if (forward =3D NULL)
+		if (!forward)
 			break;
 		if (forward =3D prev)
 			continue;
@@ -1514,7 +1514,7 @@ static int uvc_scan_chain_backward(struct uvc_video_c=
hain *chain,
 		for (i =3D 0; i < entity->bNrInPins; ++i) {
 			id =3D entity->baSourceID[i];
 			term =3D uvc_entity_by_id(chain->dev, id);
-			if (term =3D NULL || !UVC_ENTITY_IS_ITERM(term)) {
+			if (!term || !UVC_ENTITY_IS_ITERM(term)) {
 				uvc_trace(UVC_TRACE_DESCR,
 					  "Selector unit %d input %d isn't connected to an input terminal\n",
 					  entity->id, i);
@@ -1551,7 +1551,7 @@ static int uvc_scan_chain_backward(struct uvc_video_c=
hain *chain,
 	}
=20
 	entity =3D uvc_entity_by_id(chain->dev, id);
-	if (entity =3D NULL) {
+	if (!entity) {
 		uvc_trace(UVC_TRACE_DESCR,
 			  "Found reference to unknown entity %d.\n",
 			  id);
@@ -1572,7 +1572,7 @@ static int uvc_scan_chain(struct uvc_video_chain *cha=
in,
 	entity =3D term;
 	prev =3D NULL;
=20
-	while (entity !=3D NULL) {
+	while (entity) {
 		/* Entity must not be part of an existing chain */
 		if (entity->chain.next || entity->chain.prev) {
 			uvc_trace(UVC_TRACE_DESCR,
@@ -1639,7 +1639,7 @@ static struct uvc_video_chain *uvc_alloc_chain(struct=
 uvc_device *dev)
 	struct uvc_video_chain *chain;
=20
 	chain =3D kzalloc(sizeof(*chain), GFP_KERNEL);
-	if (chain =3D NULL)
+	if (!chain)
 		return NULL;
=20
 	INIT_LIST_HEAD(&chain->entities);
@@ -1689,12 +1689,12 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 		}
 	}
=20
-	if (iterm =3D NULL || oterm =3D NULL)
+	if (!iterm || !oterm)
 		return -EINVAL;
=20
 	/* Allocate the chain and fill it. */
 	chain =3D uvc_alloc_chain(dev);
-	if (chain =3D NULL)
+	if (!chain)
 		return -ENOMEM;
=20
 	if (uvc_scan_chain_entity(chain, oterm) < 0)
@@ -1765,7 +1765,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 			continue;
=20
 		chain =3D uvc_alloc_chain(dev);
-		if (chain =3D NULL)
+		if (!chain)
 			return -ENOMEM;
=20
 		term->flags |=3D UVC_ENTITY_FLAG_DEFAULT;
@@ -1970,7 +1970,7 @@ static int uvc_register_terms(struct uvc_device *dev,
 			continue;
=20
 		stream =3D uvc_stream_by_id(dev, term->id);
-		if (stream =3D NULL) {
+		if (!stream) {
 			uvc_printk(KERN_INFO,
 				   "No streaming interface found for terminal %u.",
 				   term->id);
@@ -2048,7 +2048,7 @@ static int uvc_probe(struct usb_interface *intf,
 	dev->quirks =3D (uvc_quirks_param =3D -1)
 		    ? id->driver_info : uvc_quirks_param;
=20
-	if (udev->product !=3D NULL)
+	if (udev->product)
 		strlcpy(dev->name, udev->product, sizeof dev->name);
 	else
 		snprintf(dev->name, sizeof dev->name,
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
