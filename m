From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 May 2017 18:51:26 +0000
Subject: [PATCH 1/3] coresight: etb10: Delete an error message for a failed memory allocation in etb_probe()
Message-Id: <df23f2fa-ad4a-8338-8641-96782e50f6a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d5cd752-f2f2-b511-6b1e-daf5bf1bc522@users.sourceforge.net>
In-Reply-To: <5d5cd752-f2f2-b511-6b1e-daf5bf1bc522@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 May 2017 20:23:43 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 979ea6ec7902..837aebf22c45 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -675,11 +675,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->buf = devm_kzalloc(dev,
 				    drvdata->buffer_depth * 4, GFP_KERNEL);
-	if (!drvdata->buf) {
-		dev_err(dev, "Failed to allocate %u bytes for buffer data\n",
-			drvdata->buffer_depth * 4);
+	if (!drvdata->buf)
 		return -ENOMEM;
-	}
 
 	desc.type = CORESIGHT_DEV_TYPE_SINK;
 	desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
-- 
2.12.3

