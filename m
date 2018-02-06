From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 16:16:58 +0000
Subject: [PATCH 1/3] HID: lenovo: Delete an error message for a failed memory allocation in two functions
Message-Id: <6534fccc-ce07-4802-409a-ac0234b712f8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <06e2d590-f980-0022-c476-6b999239ff9f@users.sourceforge.net>
In-Reply-To: <06e2d590-f980-0022-c476-6b999239ff9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 16:48:52 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-lenovo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 1ac4ff4d57a6..549b84d01b46 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -688,7 +688,6 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 				    sizeof(struct lenovo_drvdata_tpkbd),
 				    GFP_KERNEL);
 	if (data_pointer = NULL) {
-		hid_err(hdev, "Could not allocate memory for driver data\n");
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -746,10 +745,9 @@ static int lenovo_probe_cptkbd(struct hid_device *hdev)
 	cptkbd_data = devm_kzalloc(&hdev->dev,
 					sizeof(*cptkbd_data),
 					GFP_KERNEL);
-	if (cptkbd_data = NULL) {
-		hid_err(hdev, "can't alloc keyboard descriptor\n");
+	if (!cptkbd_data)
 		return -ENOMEM;
-	}
+
 	hid_set_drvdata(hdev, cptkbd_data);
 
 	/*
-- 
2.16.1

