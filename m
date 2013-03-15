From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Fri, 15 Mar 2013 08:14:29 +0000
Subject: [PATCH] staging: comedi: drivers: ni_atmio.c: Add a missing semicolon
Message-Id: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: fmhess@users.sourceforge.net, gregkh@linuxfoundation.org, hsweeten@visionengravers.com, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix a missing end-of-statement by adding a semicolon.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/comedi/drivers/ni_atmio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/ni_atmio.c b/drivers/staging/comedi/drivers/ni_atmio.c
index 279f2cd..37372a1 100644
--- a/drivers/staging/comedi/drivers/ni_atmio.c
+++ b/drivers/staging/comedi/drivers/ni_atmio.c
@@ -467,7 +467,7 @@ static int ni_atmio_attach(struct comedi_device *dev,
 		return -EIO;
 
 	dev->board_ptr = ni_boards + board;
-	boardtype = comedi_board(dev)
+	boardtype = comedi_board(dev);
 
 	printk(" %s", boardtype->name);
 	dev->board_name = boardtype->name;
-- 
1.7.9.5

