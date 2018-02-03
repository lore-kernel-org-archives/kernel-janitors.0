From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 21:20:10 +0000
Subject: [PATCH] HID: magicmouse: Delete an error message for a failed memory allocation in magicmouse_probe(
Message-Id: <79c01fa9-647c-5c34-41cc-3bc9c09f38ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 22:15:05 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-magicmouse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 42ed887ba0be..8d17a812c5ba 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -501,10 +501,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	int ret;
 
 	msc = devm_kzalloc(&hdev->dev, sizeof(*msc), GFP_KERNEL);
-	if (msc = NULL) {
-		hid_err(hdev, "can't alloc magicmouse descriptor\n");
+	if (!msc)
 		return -ENOMEM;
-	}
 
 	msc->scroll_accel = SCROLL_ACCEL_DEFAULT;
 
-- 
2.16.1

