From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Feb 2021 16:39:21 +0000
Subject: [PATCH][next] HID: playstation: fix array size comparison (off-by-one)
Message-Id: <20210215163921.84283-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of value with the array size ps_gamepad_hat_mapping
appears to be off-by-one. Fix this by using >= rather than > for the
size comparison.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: bc2e15a9a022 ("HID: playstation: initial DualSense USB support.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-playstation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 408b651174cf..568a3a067c88 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1064,7 +1064,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
 
 	value = ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
-	if (value > ARRAY_SIZE(ps_gamepad_hat_mapping))
+	if (value >= ARRAY_SIZE(ps_gamepad_hat_mapping))
 		value = 8; /* center */
 	input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
 	input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
-- 
2.30.0
