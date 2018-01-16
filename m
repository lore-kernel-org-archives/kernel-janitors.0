From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 17:38:03 +0000
Subject: [PATCH] HID: logitech-hidpp: remove duplicated assignment to 'hidpp'
Message-Id: <20180116173803.19272-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer hidpp is being assigned twice with the same value, remove
the second occurrance as it is redundant.

Cleans up clang warning:
drivers/hid/hid-logitech-hidpp.c:177:23: warning: Value stored to
'hidpp' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 19cc980eebce..b91e416a677d 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -177,8 +177,6 @@ static int __hidpp_send_report(struct hid_device *hdev,
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 	int fields_count, ret;
 
-	hidpp = hid_get_drvdata(hdev);
-
 	switch (hidpp_report->report_id) {
 	case REPORT_ID_HIDPP_SHORT:
 		fields_count = HIDPP_REPORT_SHORT_LENGTH;
-- 
2.15.1

