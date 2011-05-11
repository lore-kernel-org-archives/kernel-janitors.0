From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:20 +0000
Subject: [PATCH 08/12] staging: usbip: usbip_common.c: fix misspelled function name
Message-Id: <5c68db87d889a920e13ea1d97c5d0f5d46bb1824.1305103212.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change pakcet to packet in usbip_iso_packet_correct_endian().

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/usbip_common.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/usbip/usbip_common.c b/drivers/staging/usbip/usbip_common.c
index fbf549c..d2fb1ae 100644
--- a/drivers/staging/usbip/usbip_common.c
+++ b/drivers/staging/usbip/usbip_common.c
@@ -627,7 +627,7 @@ void usbip_header_correct_endian(struct usbip_header *pdu, int send)
 }
 EXPORT_SYMBOL_GPL(usbip_header_correct_endian);
 
-static void usbip_iso_pakcet_correct_endian(
+static void usbip_iso_packet_correct_endian(
 		struct usbip_iso_packet_descriptor *iso, int send)
 {
 	/* does not need all members. but copy all simply. */
@@ -677,7 +677,7 @@ void *usbip_alloc_iso_desc_pdu(struct urb *urb, ssize_t *bufflen)
 		iso = buff + (i * sizeof(*iso));
 
 		usbip_pack_iso(iso, &urb->iso_frame_desc[i], 1);
-		usbip_iso_pakcet_correct_endian(iso, 1);
+		usbip_iso_packet_correct_endian(iso, 1);
 	}
 
 	*bufflen = size;
@@ -728,7 +728,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	for (i = 0; i < np; i++) {
 		iso = buff + (i * sizeof(*iso));
 
-		usbip_iso_pakcet_correct_endian(iso, 0);
+		usbip_iso_packet_correct_endian(iso, 0);
 		usbip_pack_iso(iso, &urb->iso_frame_desc[i], 0);
 		total_length += urb->iso_frame_desc[i].actual_length;
 	}
-- 
1.7.5.1

