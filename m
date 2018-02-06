From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 14:47:33 +0000
Subject: [PATCH 3/3] hid-lg4ff: Delete an error message for a failed memory allocation in lg4ff_init()
Message-Id: <fadaaa7a-a632-ecb8-de75-05a85132a171@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c76a767-b1cb-2486-f24d-0d5a220b8985@users.sourceforge.net>
In-Reply-To: <5c76a767-b1cb-2486-f24d-0d5a220b8985@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 15:26:06 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-lg4ff.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 512d67e1aae3..ec6b94bb3fd8 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -1401,10 +1401,8 @@ int lg4ff_init(struct hid_device *hid)
 
 		for (j = 0; j < 5; j++) {
 			led = kzalloc(sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
-			if (!led) {
-				hid_err(hid, "can't allocate memory for LED %d\n", j);
+			if (!led)
 				goto err_leds;
-			}
 
 			name = (void *)(&led[1]);
 			snprintf(name, name_sz, "%s::RPM%d", dev_name(&hid->dev), j+1);
-- 
2.16.1

