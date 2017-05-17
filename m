From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 16:22:49 +0000
Subject: [PATCH] ssb: Delete an error message for a failed memory allocation in ssb_devices_register()
Message-Id: <b8db3326-5f45-04c0-a6c3-d5183d602e8d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, =?UTF-8?Q?Michael_B=c3=bcsch?= <m@bues.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 18:12:16 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ssb/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ssb/main.c b/drivers/ssb/main.c
index d1a750760cf3..65420a9f0e82 100644
--- a/drivers/ssb/main.c
+++ b/drivers/ssb/main.c
@@ -480,7 +480,6 @@ static int ssb_devices_register(struct ssb_bus *bus)
 
 		devwrap = kzalloc(sizeof(*devwrap), GFP_KERNEL);
 		if (!devwrap) {
-			ssb_err("Could not allocate device\n");
 			err = -ENOMEM;
 			goto error;
 		}
-- 
2.13.0

