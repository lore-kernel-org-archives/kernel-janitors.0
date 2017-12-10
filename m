From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 14:47:39 +0000
Subject: [PATCH] tty: nozomi: Delete an error message for a failed memory allocation in nozomi_card_init()
Message-Id: <87907c80-d589-c431-4008-ed09d39e5075@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 15:37:26 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/nozomi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/nozomi.c b/drivers/tty/nozomi.c
index b57b35066ebe..51f515ca4007 100644
--- a/drivers/tty/nozomi.c
+++ b/drivers/tty/nozomi.c
@@ -1376,7 +1376,6 @@ static int nozomi_card_init(struct pci_dev *pdev,
 
 	dc->send_buf = kmalloc(SEND_BUF_MAX, GFP_KERNEL);
 	if (!dc->send_buf) {
-		dev_err(&pdev->dev, "Could not allocate send buffer?\n");
 		ret = -ENOMEM;
 		goto err_free_sbuf;
 	}
-- 
2.15.1

