From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:49:01 +0000
Subject: [PATCH 16/19] [media] uvc_video: Adjust 18 checks for null pointers
Message-Id: <bdeb697f-4e6a-bf64-112b-907e3c298a29@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:26:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_video.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_=
video.c
index 0ed3453b1c75..617f2090aa55 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -100,7 +100,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *=
stream,
 		}
 	}
=20
-	if (format =3D NULL)
+	if (!format)
 		return;
=20
 	for (i =3D 0; i < format->nframes; ++i) {
@@ -110,7 +110,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *=
stream,
 		}
 	}
=20
-	if (frame =3D NULL)
+	if (!frame)
 		return;
=20
 	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
@@ -176,7 +176,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *str=
eam,
 		return -EIO;
=20
 	data =3D kmalloc(size, GFP_KERNEL);
-	if (data =3D NULL)
+	if (!data)
 		return -ENOMEM;
=20
 	ret =3D __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
@@ -260,7 +260,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *str=
eam,
=20
 	size =3D stream->dev->uvc_version >=3D 0x0110 ? 34 : 26;
 	data =3D kzalloc(size, GFP_KERNEL);
-	if (data =3D NULL)
+	if (!data)
 		return -ENOMEM;
=20
 	*(__le16 *)&data[0] =3D cpu_to_le16(ctrl->bmHint);
@@ -420,7 +420,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, st=
ruct uvc_buffer *buf,
 	 *   kernel timestamps and store them with the SCR STC and SOF fields
 	 *   in the ring buffer
 	 */
-	if (has_pts && buf !=3D NULL)
+	if (has_pts && buf)
 		buf->pts =3D get_unaligned_le32(&data[2]);
=20
 	if (!has_scr)
@@ -503,7 +503,7 @@ static int uvc_video_clock_init(struct uvc_streaming *s=
tream)
 	clock->samples =3D kmalloc_array(clock->size,
 				       sizeof(*clock->samples),
 				       GFP_KERNEL);
-	if (clock->samples =3D NULL)
+	if (!clock->samples)
 		return -ENOMEM;
=20
 	uvc_video_clock_reset(stream);
@@ -994,7 +994,7 @@ static int uvc_video_decode_start(struct uvc_streaming =
*stream,
 	/* Store the payload FID bit and return immediately when the buffer is
 	 * NULL.
 	 */
-	if (buf =3D NULL) {
+	if (!buf) {
 		stream->last_fid =3D fid;
 		return -ENODATA;
 	}
@@ -1169,7 +1169,7 @@ static void uvc_video_decode_isoc(struct urb *urb, st=
ruct uvc_streaming *stream,
 				  "USB isochronous frame lost (%d).\n",
 				  urb->iso_frame_desc[i].status);
 			/* Mark the buffer as faulty. */
-			if (buf !=3D NULL)
+			if (buf)
 				buf->error =3D 1;
 			continue;
 		}
@@ -1233,7 +1233,7 @@ static void uvc_video_decode_bulk(struct urb *urb, st=
ruct uvc_streaming *stream,
 		} while (ret =3D -EAGAIN);
=20
 		/* If an error occurred skip the rest of the payload. */
-		if (ret < 0 || buf =3D NULL) {
+		if (ret < 0 || !buf) {
 			stream->bulk.skip_payload =3D 1;
 		} else {
 			memcpy(stream->bulk.header, mem, ret);
@@ -1250,7 +1250,7 @@ static void uvc_video_decode_bulk(struct urb *urb, st=
ruct uvc_streaming *stream,
 	 */
=20
 	/* Process video data. */
-	if (!stream->bulk.skip_payload && buf !=3D NULL)
+	if (!stream->bulk.skip_payload && buf)
 		uvc_video_decode_data(stream, buf, mem, len);
=20
 	/* Detect the payload end by a URB smaller than the maximum size (or
@@ -1258,7 +1258,7 @@ static void uvc_video_decode_bulk(struct urb *urb, st=
ruct uvc_streaming *stream,
 	 */
 	if (urb->actual_length < urb->transfer_buffer_length ||
 	    stream->bulk.payload_size >=3D stream->bulk.max_payload_size) {
-		if (!stream->bulk.skip_payload && buf !=3D NULL) {
+		if (!stream->bulk.skip_payload && buf) {
 			uvc_video_decode_end(stream, buf, stream->bulk.header,
 				stream->bulk.payload_size);
 			if (buf->state =3D UVC_BUF_STATE_READY)
@@ -1278,7 +1278,7 @@ static void uvc_video_encode_bulk(struct urb *urb, st=
ruct uvc_streaming *stream,
 	u8 *mem =3D urb->transfer_buffer;
 	int len =3D stream->urb_size, ret;
=20
-	if (buf =3D NULL) {
+	if (!buf) {
 		urb->transfer_buffer_length =3D 0;
 		return;
 	}
@@ -1450,7 +1450,7 @@ static void uvc_uninit_video(struct uvc_streaming *st=
ream, int free_buffers)
=20
 	for (i =3D 0; i < UVC_URBS; ++i) {
 		urb =3D stream->urb[i];
-		if (urb =3D NULL)
+		if (!urb)
 			continue;
=20
 		usb_kill_urb(urb);
@@ -1511,7 +1511,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *=
stream,
=20
 	for (i =3D 0; i < UVC_URBS; ++i) {
 		urb =3D usb_alloc_urb(npackets, gfp_flags);
-		if (urb =3D NULL) {
+		if (!urb) {
 			uvc_uninit_video(stream, 1);
 			return -ENOMEM;
 		}
@@ -1577,7 +1577,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *=
stream,
=20
 	for (i =3D 0; i < UVC_URBS; ++i) {
 		urb =3D usb_alloc_urb(0, gfp_flags);
-		if (urb =3D NULL) {
+		if (!urb) {
 			uvc_uninit_video(stream, 1);
 			return -ENOMEM;
 		}
@@ -1641,7 +1641,7 @@ static int uvc_init_video(struct uvc_streaming *strea=
m, gfp_t gfp_flags)
 			alts =3D &intf->altsetting[i];
 			ep =3D uvc_find_endpoint(alts,
 				stream->header.bEndpointAddress);
-			if (ep =3D NULL)
+			if (!ep)
 				continue;
=20
 			/* Check if the bandwidth is high enough. */
@@ -1653,7 +1653,7 @@ static int uvc_init_video(struct uvc_streaming *strea=
m, gfp_t gfp_flags)
 			}
 		}
=20
-		if (best_ep =3D NULL) {
+		if (!best_ep) {
 			uvc_trace(UVC_TRACE_VIDEO,
 				  "No fast enough alt setting for requested bandwidth.\n");
 			return -EIO;
@@ -1671,7 +1671,7 @@ static int uvc_init_video(struct uvc_streaming *strea=
m, gfp_t gfp_flags)
 		/* Bulk endpoint, proceed to URB initialization. */
 		ep =3D uvc_find_endpoint(&intf->altsetting[0],
 				stream->header.bEndpointAddress);
-		if (ep =3D NULL)
+		if (!ep)
 			return -EIO;
=20
 		ret =3D uvc_init_video_bulk(stream, ep, gfp_flags);
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
