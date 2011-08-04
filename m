From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Thu, 04 Aug 2011 20:42:54 +0000
Subject: [PATCH 1/2] HID: kfree() NULL pointer cleanup
Message-Id: <1312490574-14804-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bojan Prtvar <prtvar.b@gmail.com>

Checking for NULL pointers before kfree() is redundant.

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/hid/hid-prodikeys.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 158b389..62f95d4 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -849,9 +849,7 @@ static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
 err_stop:
 	hid_hw_stop(hdev);
 err_free:
-	if (pm != NULL)
-		kfree(pm);
-
+	kfree(pm);
 	kfree(pk);
 	return ret;
 }
-- 
1.7.1

