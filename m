From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 21:00:40 +0000
Subject: [PATCH 2/2] HID: ntrig: Improve a size determination in ntrig_probe()
Message-Id: <cdf13343-71ff-1ebe-d90e-f480febbe45f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <86d02ef2-0ac2-5462-0ff0-a0cd87c3d1f7@users.sourceforge.net>
In-Reply-To: <86d02ef2-0ac2-5462-0ff0-a0cd87c3d1f7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 21:48:39 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-ntrig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 2a8dafaea2f0..c6878a6a147c 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -904,7 +904,7 @@ static int ntrig_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hdev->quirks |= HID_QUIRK_MULTI_INPUT
 				| HID_QUIRK_NO_INIT_REPORTS;
 
-	nd = kmalloc(sizeof(struct ntrig_data), GFP_KERNEL);
+	nd = kmalloc(sizeof(*nd), GFP_KERNEL);
 	if (!nd)
 		return -ENOMEM;
 
-- 
2.16.1

