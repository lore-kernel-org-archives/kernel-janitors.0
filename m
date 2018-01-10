From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:05:31 +0000
Subject: [PATCH 2/3] sgi-xpc: Improve a size determination in two functions
Message-Id: <683a3165-76e9-6b49-d6b1-695456ba3b75@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
In-Reply-To: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:18:12 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpc_uv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 0c95f9994649..8a8dfcbbe729 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -212,10 +212,9 @@ xpc_create_gru_mq_uv(unsigned int mq_size, int cpu, char *irq_name,
 	int nasid;
 	int pg_order;
 	struct page *page;
-	struct xpc_gru_mq_uv *mq;
 	struct uv_IO_APIC_route_entry *mmr_value;
+	struct xpc_gru_mq_uv *mq = kmalloc(sizeof(*mq), GFP_KERNEL);
 
-	mq = kmalloc(sizeof(struct xpc_gru_mq_uv), GFP_KERNEL);
 	if (mq = NULL) {
 		ret = -ENOMEM;
 		goto out_0;
@@ -686,9 +685,7 @@ xpc_send_activate_IRQ_uv(struct xpc_partition *part, void *msg, size_t msg_size,
 	if (!(part_uv->flags & XPC_P_CACHED_ACTIVATE_GRU_MQ_DESC_UV)) {
 		gru_mq_desc = part_uv->cached_activate_gru_mq_desc;
 		if (gru_mq_desc = NULL) {
-			gru_mq_desc = kmalloc(sizeof(struct
-					      gru_message_queue_desc),
-					      GFP_KERNEL);
+			gru_mq_desc = kmalloc(sizeof(*gru_mq_desc), GFP_KERNEL);
 			if (gru_mq_desc = NULL) {
 				ret = xpNoMemory;
 				goto done;
-- 
2.15.1

