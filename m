From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 08:19:21 +0000
Subject: [PATCH] hid-saitek: Delete an error message for a failed memory allocation in saitek_probe()
Message-Id: <e04a936f-9925-3808-9274-6cffe3c63cc3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 09:12:24 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-saitek.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index 39e642686ff0..49355ceddd85 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -45,10 +45,8 @@ static int saitek_probe(struct hid_device *hdev,
 	int ret;
 
 	ssc = devm_kzalloc(&hdev->dev, sizeof(*ssc), GFP_KERNEL);
-	if (ssc = NULL) {
-		hid_err(hdev, "can't alloc saitek descriptor\n");
+	if (!ssc)
 		return -ENOMEM;
-	}
 
 	ssc->quirks = quirks;
 	ssc->mode = -1;
-- 
2.16.1

