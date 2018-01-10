From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:04:41 +0000
Subject: [PATCH 1/3] sgi-xpc: Delete error messages for a failed memory allocation in three functions
Message-Id: <c3fd4b0b-b34e-92ae-18ca-2983d2ec4dc1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
In-Reply-To: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:00:17 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpc_main.c | 8 ++------
 drivers/misc/sgi-xp/xpc_uv.c   | 4 ----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 0c775d6fcf59..c90a9ff30680 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -418,10 +418,8 @@ xpc_setup_ch_structures(struct xpc_partition *part)
 	DBUG_ON(part->channels != NULL);
 	part->channels = kzalloc(sizeof(struct xpc_channel) * XPC_MAX_NCHANNELS,
 				 GFP_KERNEL);
-	if (part->channels = NULL) {
-		dev_err(xpc_chan, "can't get memory for channels\n");
+	if (!part->channels)
 		return xpNoMemory;
-	}
 
 	/* allocate the remote open and close args */
 
@@ -907,10 +905,8 @@ xpc_setup_partitions(void)
 
 	xpc_partitions = kzalloc(sizeof(struct xpc_partition) *
 				 xp_max_npartitions, GFP_KERNEL);
-	if (xpc_partitions = NULL) {
-		dev_err(xpc_part, "can't get memory for partition structure\n");
+	if (!xpc_partitions)
 		return -ENOMEM;
-	}
 
 	/*
 	 * The first few fields of each entry of xpc_partitions[] need to
diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 340b44d9e8cf..0c95f9994649 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -217,8 +217,6 @@ xpc_create_gru_mq_uv(unsigned int mq_size, int cpu, char *irq_name,
 
 	mq = kmalloc(sizeof(struct xpc_gru_mq_uv), GFP_KERNEL);
 	if (mq = NULL) {
-		dev_err(xpc_part, "xpc_create_gru_mq_uv() failed to kmalloc() "
-			"a xpc_gru_mq_uv structure\n");
 		ret = -ENOMEM;
 		goto out_0;
 	}
@@ -226,8 +224,6 @@ xpc_create_gru_mq_uv(unsigned int mq_size, int cpu, char *irq_name,
 	mq->gru_mq_desc = kzalloc(sizeof(struct gru_message_queue_desc),
 				  GFP_KERNEL);
 	if (mq->gru_mq_desc = NULL) {
-		dev_err(xpc_part, "xpc_create_gru_mq_uv() failed to kmalloc() "
-			"a gru_message_queue_desc structure\n");
 		ret = -ENOMEM;
 		goto out_1;
 	}
-- 
2.15.1

