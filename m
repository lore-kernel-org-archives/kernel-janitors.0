From: "Denver Gingerich" <denver@ossguy.com>
Date: Thu, 10 May 2007 01:32:40 +0000
Subject: [KJ] [PATCH] fix compiler warning in sn9c102_core.c
Message-Id: <6defe8840705091832u31dde3a0qb7dca10185b4063f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct the following compiler warning:
warning: 'sn9c102_write_eoimarker' defined but not used

Verified that there are no sn9c102_write_eoimarker() calls in the kernel tree.

Signed-off-by: Denver Gingerich <denver@ossguy.com>

---

--- linux-2.6.21/drivers/media/video/sn9c102/sn9c102_core.c.000	2007-05-09
18:56:30.000000000 -0400
+++ linux-2.6.21/drivers/media/video/sn9c102/sn9c102_core.c	2007-05-09
20:33:58.000000000 -0400
@@ -657,16 +657,6 @@ sn9c102_write_jpegheader(struct sn9c102_
 }


-static void
-sn9c102_write_eoimarker(struct sn9c102_device* cam, struct sn9c102_frame_t* f)
-{
-	static const u8 eoi_marker[2] = {0xff, 0xd9};
-
-	memcpy(f->bufmem + f->buf.bytesused, eoi_marker, sizeof(eoi_marker));
-	f->buf.bytesused += sizeof(eoi_marker);
-}
-
-
 static void sn9c102_urb_complete(struct urb *urb)
 {
 	struct sn9c102_device* cam = urb->context;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
