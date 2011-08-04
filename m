From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Thu, 04 Aug 2011 20:43:46 +0000
Subject: [PATCH 2/2] HID: kfree() NULL pointer cleanup
Message-Id: <1312490626-14838-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bojan Prtvar <prtvar.b@gmail.com>

Checking for NULL pointers before kfree() is redundant.

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/hid/hid-zydacron.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-zydacron.c b/drivers/hid/hid-zydacron.c
index e903715..1ad85f2 100644
--- a/drivers/hid/hid-zydacron.c
+++ b/drivers/hid/hid-zydacron.c
@@ -201,9 +201,7 @@ static void zc_remove(struct hid_device *hdev)
 	struct zc_device *zc = hid_get_drvdata(hdev);
 
 	hid_hw_stop(hdev);
-
-	if (NULL != zc)
-		kfree(zc);
+	kfree(zc);
 }
 
 static const struct hid_device_id zc_devices[] = {
-- 
1.7.1

