From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 13:27:57 +0000
Subject: [PATCH] char/raw: Delete an error message for a failed memory allocation in raw_init()
Message-Id: <e76691ba-8e80-554f-efba-9f2a448d46c2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:22:10 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/raw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/raw.c b/drivers/char/raw.c
index 293167c6e254..fa416613e215 100644
--- a/drivers/char/raw.c
+++ b/drivers/char/raw.c
@@ -323,7 +323,6 @@ static int __init raw_init(void)
 
 	raw_devices = vzalloc(sizeof(struct raw_device_data) * max_raw_minors);
 	if (!raw_devices) {
-		printk(KERN_ERR "Not enough memory for raw device structures\n");
 		ret = -ENOMEM;
 		goto error;
 	}
-- 
2.14.2

