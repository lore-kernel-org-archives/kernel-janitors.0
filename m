From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 15:31:18 +0000
Subject: [PATCH 1/2] tty: moxa: Delete an error message for a failed memory allocation in moxa_init_board()
Message-Id: <d3ecae07-042f-ad07-9ecf-73e67e9b3282@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d1badbd-8bb1-4109-5c40-1ba1f226a2b1@users.sourceforge.net>
In-Reply-To: <7d1badbd-8bb1-4109-5c40-1ba1f226a2b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 16:03:21 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/moxa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index 65a70f3c7cde..a74caf05cf57 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -836,7 +836,6 @@ static int moxa_init_board(struct moxa_board_conf *brd, struct device *dev)
 	brd->ports = kcalloc(MAX_PORTS_PER_BOARD, sizeof(*brd->ports),
 			GFP_KERNEL);
 	if (brd->ports = NULL) {
-		printk(KERN_ERR "cannot allocate memory for ports\n");
 		ret = -ENOMEM;
 		goto err;
 	}
-- 
2.15.1

