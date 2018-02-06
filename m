From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 17:30:50 +0000
Subject: [PATCH 2/2] HID: asus: Return an error code only as a constant in asus_start_multitouch()
Message-Id: <8408b92e-81fc-89d2-6bf3-e7948673fed6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5289ace9-8927-9803-4692-c7c621ab0a8d@users.sourceforge.net>
In-Reply-To: <5289ace9-8927-9803-4692-c7c621ab0a8d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 18:18:50 +0100

Return an error code without storing it in an intermediate variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-asus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 9573e0b41922..5e143552dab9 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -564,10 +564,8 @@ static int asus_start_multitouch(struct hid_device *hdev)
 	const unsigned char buf[] = { FEATURE_REPORT_ID, 0x00, 0x03, 0x01, 0x00 };
 	unsigned char *dmabuf = kmemdup(buf, sizeof(buf), GFP_KERNEL);
 
-	if (!dmabuf) {
-		ret = -ENOMEM;
-		return ret;
-	}
+	if (!dmabuf)
+		return -ENOMEM;
 
 	ret = hid_hw_raw_request(hdev, dmabuf[0], dmabuf, sizeof(buf),
 					HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
-- 
2.16.1

