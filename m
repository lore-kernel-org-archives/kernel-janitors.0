From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Thu, 20 Sep 2012 01:47:58 +0000
Subject: [PATCH] various: Fix spelling of "registered" in comments.
Message-Id: <1348105682-25196-1-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "registered"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/cris/include/arch-v10/arch/irq.h |    2 +-
 arch/cris/include/arch-v32/arch/irq.h |    2 +-
 include/linux/netdevice.h             |    2 +-
 include/linux/nfc.h                   |    2 +-
 include/net/irda/irlmp.h              |    2 +-
 net/netfilter/nf_log.c                |    2 +-
 sound/core/seq/seq_device.c           |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/cris/include/arch-v10/arch/irq.h b/arch/cris/include/arch-v10/arch/irq.h
index 7d34594..ca2675a 100644
--- a/arch/cris/include/arch-v10/arch/irq.h
+++ b/arch/cris/include/arch-v10/arch/irq.h
@@ -142,7 +142,7 @@ __asm__ ( \
  * it here, we would not get the multiple_irq at all.
  *
  * The non-blocking here is based on the knowledge that the timer interrupt is 
- * registred as a fast interrupt (IRQF_DISABLED) so that we _know_ there will not
+ * registered as a fast interrupt (IRQF_DISABLED) so that we _know_ there will not
  * be an sti() before the timer irq handler is run to acknowledge the interrupt.
  */
 
diff --git a/arch/cris/include/arch-v32/arch/irq.h b/arch/cris/include/arch-v32/arch/irq.h
index b31e998..fe3cdd2 100644
--- a/arch/cris/include/arch-v32/arch/irq.h
+++ b/arch/cris/include/arch-v32/arch/irq.h
@@ -103,7 +103,7 @@ __asm__ (				\
  * if we had BLOCK'edit here, we would not get the multiple_irq at all.
  *
  * The non-blocking here is based on the knowledge that the timer interrupt is
- * registred as a fast interrupt (IRQF_DISABLED) so that we _know_ there will not
+ * registered as a fast interrupt (IRQF_DISABLED) so that we _know_ there will not
  * be an sti() before the timer irq handler is run to acknowledge the interrupt.
  */
 #define BUILD_TIMER_IRQ(nr, mask) 	\
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 59dc05f3..38c8df7 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -399,7 +399,7 @@ typedef enum gro_result gro_result_t;
  *
  * If the rx_handler consider the skb should be ignored, it should return
  * RX_HANDLER_EXACT. The skb will only be delivered to protocol handlers that
- * are registred on exact device (ptype->dev = skb->dev).
+ * are registered on exact device (ptype->dev = skb->dev).
  *
  * If the rx_handler didn't changed skb->dev, but want the skb to be normally
  * delivered, it should return RX_HANDLER_PASS.
diff --git a/include/linux/nfc.h b/include/linux/nfc.h
index 6189f27..91c5f4e 100644
--- a/include/linux/nfc.h
+++ b/include/linux/nfc.h
@@ -51,7 +51,7 @@
  *	%NFC_ATTR_DEVICE_INDEX)
  * @NFC_EVENT_TARGETS_FOUND: event emitted when a new target is found
  *	(it sends %NFC_ATTR_DEVICE_INDEX)
- * @NFC_EVENT_DEVICE_ADDED: event emitted when a new device is registred
+ * @NFC_EVENT_DEVICE_ADDED: event emitted when a new device is registered
  *	(it sends %NFC_ATTR_DEVICE_NAME, %NFC_ATTR_DEVICE_INDEX and
  *	%NFC_ATTR_PROTOCOLS)
  * @NFC_EVENT_DEVICE_REMOVED: event emitted when a device is removed
diff --git a/include/net/irda/irlmp.h b/include/net/irda/irlmp.h
index fff11b7..591f786 100644
--- a/include/net/irda/irlmp.h
+++ b/include/net/irda/irlmp.h
@@ -134,7 +134,7 @@ typedef struct {
 } CACHE_ENTRY;
 
 /*
- *  Information about each registred IrLAP layer
+ *  Information about each registered IrLAP layer
  */
 struct lap_cb {
 	irda_queue_t queue; /* Must be first */
diff --git a/net/netfilter/nf_log.c b/net/netfilter/nf_log.c
index 703fb26..9e31269 100644
--- a/net/netfilter/nf_log.c
+++ b/net/netfilter/nf_log.c
@@ -32,7 +32,7 @@ static struct nf_logger *__find_logger(int pf, const char *str_logger)
 	return NULL;
 }
 
-/* return EEXIST if the same logger is registred, 0 on success. */
+/* return EEXIST if the same logger is registered, 0 on success. */
 int nf_log_register(u_int8_t pf, struct nf_logger *logger)
 {
 	const struct nf_logger *llog;
diff --git a/sound/core/seq/seq_device.c b/sound/core/seq/seq_device.c
index 5cf8d65..adac415 100644
--- a/sound/core/seq/seq_device.c
+++ b/sound/core/seq/seq_device.c
@@ -66,7 +66,7 @@ struct ops_list {
 	/* operators */
 	struct snd_seq_dev_ops ops;
 
-	/* registred devices */
+	/* registered devices */
 	struct list_head dev_list;	/* list of devices */
 	int num_devices;	/* number of associated devices */
 	int num_init_devices;	/* number of initialized devices */
-- 
1.7.7.3

