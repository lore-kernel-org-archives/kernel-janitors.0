From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:19:21 +0000
Subject: [PATCH 4/4] vmbus: Adjust five checks for null pointers
Message-Id: <bca350e0-9523-dd6e-4dd8-a0f8ee93dc87@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
In-Reply-To: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 17:52:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hv/vmbus_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index ff94b111ed8d..b55b979ecf8a 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -93,7 +93,7 @@ static DEFINE_SEMAPHORE(hyperv_mmio_lock);
 
 static int vmbus_exists(void)
 {
-	if (hv_acpi_dev = NULL)
+	if (!hv_acpi_dev)
 		return -ENODEV;
 
 	return 0;
@@ -568,7 +568,7 @@ static const struct hv_vmbus_device_id *hv_vmbus_get_id(struct hv_driver *drv,
 		return id;
 
 	id = drv->id_table;
-	if (id = NULL)
+	if (!id)
 		return NULL; /* empty device table */
 
 	for (; !is_null_guid(&id->guid); id++)
@@ -871,7 +871,7 @@ void vmbus_on_msg_dpc(unsigned long data)
 	entry = &channel_message_table[hdr->msgtype];
 	if (entry->handler_type	= VMHT_BLOCKING) {
 		ctx = kmalloc(sizeof(*ctx), GFP_ATOMIC);
-		if (ctx = NULL)
+		if (!ctx)
 			return;
 
 		INIT_WORK(&ctx->work, vmbus_onmessage_work);
@@ -894,7 +894,7 @@ static void vmbus_channel_isr(struct vmbus_channel *channel)
 	void (*callback_fn)(void *);
 
 	callback_fn = READ_ONCE(channel->onchannel_callback);
-	if (likely(callback_fn != NULL))
+	if (likely(callback_fn))
 		(*callback_fn)(channel->channel_callback_context);
 }
 
@@ -970,7 +970,7 @@ static void vmbus_isr(void)
 	union hv_synic_event_flags *event;
 	bool handled = false;
 
-	if (unlikely(page_addr = NULL))
+	if (unlikely(!page_addr))
 		return;
 
 	event = (union hv_synic_event_flags *)page_addr +
-- 
2.12.3

