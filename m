From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2012 06:58:07 +0000
Subject: [patch] hv: fix return type of hv_post_message()
Message-Id: <20120328065807.GB9113@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This function returns negative error codes, but because the type is u16
they get truncated into positive numbers.  It doesn't look like the
callers care, but we should fix it anyway as a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 699f0d8..b9426a6 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -495,7 +495,7 @@ extern int hv_init(void);
 
 extern void hv_cleanup(void);
 
-extern u16 hv_post_message(union hv_connection_id connection_id,
+extern int hv_post_message(union hv_connection_id connection_id,
 			 enum hv_message_type message_type,
 			 void *payload, size_t payload_size);
 
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 15956bd..86f8885 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -252,7 +252,7 @@ void hv_cleanup(void)
  *
  * This involves a hypercall.
  */
-u16 hv_post_message(union hv_connection_id connection_id,
+int hv_post_message(union hv_connection_id connection_id,
 		  enum hv_message_type message_type,
 		  void *payload, size_t payload_size)
 {
