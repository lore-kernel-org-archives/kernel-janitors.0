From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 17:37:50 +0000
Subject: [PATCH 1/6] hid-prodikeys: Delete two error messages for a failed memory allocation in pk_probe()
Message-Id: <b0d723a5-73f9-e937-b93b-79174d4d0ede@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c388b4d8-fa43-1bf2-e27d-1a3a8d636118@users.sourceforge.net>
In-Reply-To: <c388b4d8-fa43-1bf2-e27d-1a3a8d636118@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 14:36:20 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-prodikeys.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 87eda34ea2f8..9cad4973a67b 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -802,15 +802,12 @@ static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	pk = kzalloc(sizeof(*pk), GFP_KERNEL);
-	if (pk = NULL) {
-		hid_err(hdev, "can't alloc descriptor\n");
+	if (!pk)
 		return -ENOMEM;
-	}
 
 	pk->hdev = hdev;
 
 	pm = kzalloc(sizeof(*pm), GFP_KERNEL);
 	if (pm = NULL) {
-		hid_err(hdev, "can't alloc descriptor\n");
 		ret = -ENOMEM;
 		goto err_free_pk;
 	}
-- 
2.16.1

