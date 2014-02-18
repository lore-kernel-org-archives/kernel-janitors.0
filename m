From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2014 12:18:10 +0000
Subject: [patch] staging: gdm724x: cleanup alloc_tx_sdu_struct()
Message-Id: <20140218121810.GA9604@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The kfree(t_sdu->buf) sets off a private static checker warning because
"t_sdu->buf" is always NULL.

This function just allocates two pointers so we can re-write it to be
simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
index 33458a583142..03b43056fcf2 100644
--- a/drivers/staging/gdm724x/gdm_usb.c
+++ b/drivers/staging/gdm724x/gdm_usb.c
@@ -119,28 +119,15 @@ out:
 
 static struct usb_tx_sdu *alloc_tx_sdu_struct(void)
 {
-	struct usb_tx_sdu *t_sdu = NULL;
-	int ret = 0;
-
+	struct usb_tx_sdu *t_sdu;
 
 	t_sdu = kzalloc(sizeof(struct usb_tx_sdu), GFP_ATOMIC);
-	if (!t_sdu) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!t_sdu)
+		return NULL;
 
 	t_sdu->buf = kmalloc(SDU_BUF_SIZE, GFP_ATOMIC);
 	if (!t_sdu->buf) {
-		ret = -ENOMEM;
-		goto out;
-	}
-out:
-
-	if (ret < 0) {
-		if (t_sdu) {
-			kfree(t_sdu->buf);
-			kfree(t_sdu);
-		}
+		kfree(t_sdu);
 		return NULL;
 	}
 
