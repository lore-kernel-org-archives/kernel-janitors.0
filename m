From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:22 +0000
Subject: [PATCH 10/12] staging: usbip: stub.h: reorganize
Message-Id: <0c69d5dca8343610c9bdeee5f2f5823341f44e13.1305103213.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Move a few functions around for better organization and add missing
parameter names in function declarations.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub.h |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/usbip/stub.h b/drivers/staging/usbip/stub.h
index a3adc2c..2cc596e 100644
--- a/drivers/staging/usbip/stub.h
+++ b/drivers/staging/usbip/stub.h
@@ -86,21 +86,22 @@ struct bus_id_priv {
 	char shutdown_busid;
 };
 
+/* stub_priv is allocated from stub_priv_cache */
 extern struct kmem_cache *stub_priv_cache;
 
-/* stub_tx.c */
-void stub_complete(struct urb *);
-int stub_tx_loop(void *data);
-
 /* stub_dev.c */
 extern struct usb_driver stub_driver;
 
-/* stub_rx.c */
-int stub_rx_loop(void *data);
-void stub_enqueue_ret_unlink(struct stub_device *, __u32, __u32);
-
 /* stub_main.c */
 struct bus_id_priv *get_busid_priv(const char *busid);
 int del_match_busid(char *busid);
-
 void stub_device_cleanup_urbs(struct stub_device *sdev);
+
+/* stub_rx.c */
+int stub_rx_loop(void *data);
+
+/* stub_tx.c */
+void stub_enqueue_ret_unlink(struct stub_device *sdev, __u32 seqnum,
+			     __u32 status);
+void stub_complete(struct urb *urb);
+int stub_tx_loop(void *data);
-- 
1.7.5.1

