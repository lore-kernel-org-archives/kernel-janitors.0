From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Apr 2017 12:35:33 +0000
Subject: [PATCH] drivers/tty/hvc: fix spelling mistake: "missmanaged" -> "mismanaged"
Message-Id: <20170422123533.8567-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Peter Hurley <peter@hurleysoftware.com>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in printk message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/hvc/hvcs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 7823d6d998cf..2113c64d565d 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -1242,8 +1242,7 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
 		free_irq(irq, hvcsd);
 		return;
 	} else if (hvcsd->port.count < 0) {
-		printk(KERN_ERR "HVCS: vty-server@%X open_count: %d"
-				" is missmanaged.\n",
+		printk(KERN_ERR "HVCS: vty-server@%X open_count: %d is mismanaged.\n",
 		hvcsd->vdev->unit_address, hvcsd->port.count);
 	}
 
-- 
2.11.0

