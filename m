From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 11:15:27 +0000
Subject: [PATCH 2/3] [media] Siano: Improve a size determination in six functions
Message-Id: <444ee06a-458c-675f-f8ae-a551b32d5d83@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <386b5a60-548e-1896-5271-4875fa2aea94@users.sourceforge.net>
In-Reply-To: <386b5a60-548e-1896-5271-4875fa2aea94@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 12:38:39 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/common/siano/smscoreapi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 889b486fbc72..ad1c41f727b1 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -447,5 +447,5 @@ static struct smscore_registry_entry_t *smscore_find_registry(char *devpath)
 			return entry;
 		}
 	}
-	entry = kmalloc(sizeof(struct smscore_registry_entry_t), GFP_KERNEL);
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (entry) {
@@ -536,7 +536,5 @@ int smscore_register_hotplug(hotplug_t hotplug)
 	int rc = 0;
 
 	kmutex_lock(&g_smscore_deviceslock);
-
-	notifyee = kmalloc(sizeof(struct smscore_device_notifyee_t),
-			   GFP_KERNEL);
+	notifyee = kmalloc(sizeof(*notifyee), GFP_KERNEL);
 	if (notifyee) {
@@ -627,5 +625,5 @@ smscore_buffer_t *smscore_createbuffer(u8 *buffer, void *common_buffer,
 {
 	struct smscore_buffer_t *cb;
 
-	cb = kzalloc(sizeof(struct smscore_buffer_t), GFP_KERNEL);
+	cb = kzalloc(sizeof(*cb), GFP_KERNEL);
 	if (!cb)
@@ -655,5 +653,5 @@ int smscore_register_device(struct smsdevice_params_t *params,
 	struct smscore_device_t *dev;
 	u8 *buffer;
 
-	dev = kzalloc(sizeof(struct smscore_device_t), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -1684,5 +1682,5 @@ static int smscore_validate_client(struct smscore_device_t *coredev,
 		pr_err("The msg ID already registered to another client.\n");
 		return -EEXIST;
 	}
-	listentry = kzalloc(sizeof(struct smscore_idlist_t), GFP_KERNEL);
+	listentry = kzalloc(sizeof(*listentry), GFP_KERNEL);
 	if (!listentry)
@@ -1721,5 +1719,5 @@ int smscore_register_client(struct smscore_device_t *coredev,
 		return -EEXIST;
 	}
 
-	newclient = kzalloc(sizeof(struct smscore_client_t), GFP_KERNEL);
+	newclient = kzalloc(sizeof(*newclient), GFP_KERNEL);
 	if (!newclient)
-- 
2.14.1

