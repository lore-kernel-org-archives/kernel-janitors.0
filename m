From: Colin King <colin.king@canonical.com>
Date: Sun, 22 Sep 2019 11:50:54 +0000
Subject: [PATCH] HID: core: clean up indentation issue
Message-Id: <20190922115054.10880-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement that is indented by one extra space,
fix this by removing the extraneous space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3eaee2c37931..9469c382a182 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2329,10 +2329,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.20.1
