From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 May 2017 18:52:20 +0000
Subject: [PATCH 2/3] coresight: etb10: Fix a typo in a comment line
Message-Id: <800735a2-6947-0760-59f5-d53401f4b0cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d5cd752-f2f2-b511-6b1e-daf5bf1bc522@users.sourceforge.net>
In-Reply-To: <5d5cd752-f2f2-b511-6b1e-daf5bf1bc522@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 May 2017 20:30:42 +0200

Delete a character in this description for a condition check.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 837aebf22c45..d5b96423e1a5 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -375,7 +375,7 @@ static void etb_update_buffer(struct coresight_device *csdev,
 
 	/*
 	 * Entries should be aligned to the frame size.  If they are not
-	 * go back to the last alignement point to give decoding tools a
+	 * go back to the last alignment point to give decoding tools a
 	 * chance to fix things.
 	 */
 	if (write_ptr % ETB_FRAME_SIZE_WORDS) {
-- 
2.12.3

