From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Sep 2018 14:00:52 +0000
Subject: [PATCH] HID: elan: fix spelling mistake "registred" -> "registered"
Message-Id: <20180927140052.28166-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in hid_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-elan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 07e26c3567eb..0bfd6d1b44c1 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -497,7 +497,7 @@ static int elan_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return 0;
 
 	if (!drvdata->input) {
-		hid_err(hdev, "Input device is not registred\n");
+		hid_err(hdev, "Input device is not registered\n");
 		ret = -ENAVAIL;
 		goto err;
 	}
-- 
2.17.1
