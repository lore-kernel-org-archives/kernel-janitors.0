From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 20:43:27 +0000
Subject: [PATCH 2/3] mfd/abx500-core: Improve two size determinations in abx500_register_ops()
Message-Id: <777a907c-49b6-287f-3ce6-a31ae1b84abd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1862d7a-412e-9aaf-8200-bb2070ee402a@users.sourceforge.net>
In-Reply-To: <d1862d7a-412e-9aaf-8200-bb2070ee402a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 21:19:10 +0100

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/abx500-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/abx500-core.c b/drivers/mfd/abx500-core.c
index c8c9d41abcaa..17176e91cbd0 100644
--- a/drivers/mfd/abx500-core.c
+++ b/drivers/mfd/abx500-core.c
@@ -37,14 +37,12 @@ int abx500_register_ops(struct device *dev, struct abx500_ops *ops)
 {
 	struct abx500_device_entry *dev_entry;
 
-	dev_entry = devm_kzalloc(dev,
-				 sizeof(struct abx500_device_entry),
-				 GFP_KERNEL);
+	dev_entry = devm_kzalloc(dev, sizeof(*dev_entry), GFP_KERNEL);
 	if (!dev_entry)
 		return -ENOMEM;
 
 	dev_entry->dev = dev;
-	memcpy(&dev_entry->ops, ops, sizeof(struct abx500_ops));
+	memcpy(&dev_entry->ops, ops, sizeof(*ops));
 
 	list_add_tail(&dev_entry->list, &abx500_list);
 	return 0;
-- 
2.15.1

