From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 16:25:59 +0000
Subject: [PATCH] tty: cyclades: Delete an error message for a failed memory allocation in cy_init_card()
Message-Id: <e4745dae-bcfc-6ddc-e601-2b21ace53834@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 17:21:28 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/cyclades.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/cyclades.c b/drivers/tty/cyclades.c
index 5d442469c95e..a0dbce2cf2d9 100644
--- a/drivers/tty/cyclades.c
+++ b/drivers/tty/cyclades.c
@@ -3061,10 +3061,8 @@ static int cy_init_card(struct cyclades_card *cinfo)
 
 	cinfo->ports = kcalloc(cinfo->nports, sizeof(*cinfo->ports),
 			GFP_KERNEL);
-	if (cinfo->ports = NULL) {
-		printk(KERN_ERR "Cyclades: cannot allocate ports\n");
+	if (!cinfo->ports)
 		return -ENOMEM;
-	}
 
 	for (channel = 0, port = cinfo->first_line; channel < cinfo->nports;
 			channel++, port++) {
-- 
2.15.1

