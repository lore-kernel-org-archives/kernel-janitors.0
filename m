From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 20:29:13 +0000
Subject: [PATCH 3/4] uwb/i1480/dfu/mac: Delete an error message for a failed memory allocation in fw_hdrs_loa
Message-Id: <f1b2af49-d020-9eab-1e53-9880aefad8a9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
In-Reply-To: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 21:00:03 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uwb/i1480/dfu/mac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/uwb/i1480/dfu/mac.c b/drivers/uwb/i1480/dfu/mac.c
index 6ec14f5fcde4..ee71973f47ad 100644
--- a/drivers/uwb/i1480/dfu/mac.c
+++ b/drivers/uwb/i1480/dfu/mac.c
@@ -123,11 +123,9 @@ int fw_hdrs_load(struct i1480 *i1480, struct fw_hdr **phdr,
 	data_itr = data;
 	data_top = (u32 *) (_data + data_size);
 	while (data_itr < data_top) {
-		result = -ENOMEM;
 		hdr = kmalloc(sizeof(*hdr), GFP_KERNEL);
 		if (hdr = NULL) {
-			dev_err(i1480->dev, "Cannot allocate fw header "
-			       "for chunk #%u\n", hdr_cnt);
+			result = -ENOMEM;
 			goto error_alloc;
 		}
 		result = fw_hdr_load(i1480, hdr, hdr_cnt,
-- 
2.15.1

