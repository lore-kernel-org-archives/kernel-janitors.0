From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 16:17:46 +0000
Subject: [PATCH 2/3] HID: lenovo: Improve a size determination in lenovo_probe_tpkbd()
Message-Id: <4c71a06e-3c13-81e6-42a3-43bae24fe1cf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <06e2d590-f980-0022-c476-6b999239ff9f@users.sourceforge.net>
In-Reply-To: <06e2d590-f980-0022-c476-6b999239ff9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 16:52:58 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 549b84d01b46..f863b94f3476 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -685,7 +685,7 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 		hid_warn(hdev, "Could not create sysfs group: %d\n", ret);
 
 	data_pointer = devm_kzalloc(&hdev->dev,
-				    sizeof(struct lenovo_drvdata_tpkbd),
+				    sizeof(*data_pointer),
 				    GFP_KERNEL);
 	if (data_pointer = NULL) {
 		ret = -ENOMEM;
-- 
2.16.1

