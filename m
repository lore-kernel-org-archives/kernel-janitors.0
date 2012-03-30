From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 30 Mar 2012 11:50:33 +0000
Subject: [PATCH] Drivers: hv: Fix return type of hv_post_message().
Message-Id: <1333107513-10434-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Santosh Nayak <santoshprasadnayak@gmail.com>

On failed memory allocation 'hv_post_message()' returns -ENOMEM.
As return type of this function is 'u16', -ENOMEM becomes 65524.
Change the return type from 'u16' to 'int'.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/hv/hv.c           |    2 +-
 drivers/hv/hyperv_vmbus.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.7.4.4

