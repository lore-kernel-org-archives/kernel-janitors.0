From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 22 Apr 2012 09:15:12 +0000
Subject: [PATCH] drivers/block/cpqarray.c: add missing cmd_free
Message-Id: <1335086112-10528-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chirag Kantharia <chirag.kantharia@hp.com>
Cc: kernel-janitors@vger.kernel.org, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Call cmd_free(h, c, 0); before leaving the function as done on all other
exit paths.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/cpqarray.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 9125bbe..db6f15d 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -1334,6 +1334,7 @@ static int ida_ctlr_ioctl(ctlr_info_t *h, int dsk, ida_ioctl_t *io)
 	case READ_FLASH_ROM:
 		if (copy_to_user(io->sg[0].addr, p, io->sg[0].size)) {
 			kfree(p);
+			cmd_free(h, c, 0);
 			return -EFAULT;
 		}
 		/* fall through and free p */

