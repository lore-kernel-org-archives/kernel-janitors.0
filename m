From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 16:07:03 +0000
Subject: [PATCH] tty: isicom: Delete an error message for a failed memory allocation in load_firmware()
Message-Id: <b1cad3dc-17bc-d86a-8c2d-f44331f3dcc8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 17:00:05 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/isicom.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/isicom.c b/drivers/tty/isicom.c
index ee7958ab269f..c087ebfe62fd 100644
--- a/drivers/tty/isicom.c
+++ b/drivers/tty/isicom.c
@@ -1482,11 +1482,9 @@ static int load_firmware(struct pci_dev *pdev,
 		}
 
 		data = kmalloc(word_count * 2, GFP_KERNEL);
-		if (data = NULL) {
-			dev_err(&pdev->dev, "Card%d, firmware upload "
-				"failed, not enough memory\n", index + 1);
+		if (!data)
 			goto errrelfw;
-		}
+
 		inw(base);
 		insw(base, data, word_count);
 		InterruptTheCard(base);
-- 
2.15.1

