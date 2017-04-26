From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 08:05:27 +0000
Subject: [PATCH] reset: sti: Use devm_kcalloc() in syscfg_reset_controller_register()
Message-Id: <e10a20a2-cfea-5b42-db3a-41b6eb08d7e4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 09:50:34 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

* Delete the local variable "size" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/reset/sti/reset-syscfg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/sti/reset-syscfg.c b/drivers/reset/sti/reset-syscfg.c
index 9bd57a5eee72..7e0f2aa55ba7 100644
--- a/drivers/reset/sti/reset-syscfg.c
+++ b/drivers/reset/sti/reset-syscfg.c
@@ -145,16 +145,14 @@ static int syscfg_reset_controller_register(struct device *dev,
 				const struct syscfg_reset_controller_data *data)
 {
 	struct syscfg_reset_controller *rc;
-	size_t size;
 	int i, err;
 
 	rc = devm_kzalloc(dev, sizeof(*rc), GFP_KERNEL);
 	if (!rc)
 		return -ENOMEM;
 
-	size = sizeof(struct syscfg_reset_channel) * data->nr_channels;
-
-	rc->channels = devm_kzalloc(dev, size, GFP_KERNEL);
+	rc->channels = devm_kcalloc(dev, data->nr_channels,
+				    sizeof(*rc->channels), GFP_KERNEL);
 	if (!rc->channels)
 		return -ENOMEM;
 
-- 
2.12.2

