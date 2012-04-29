From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Apr 2012 20:14:44 +0000
Subject: [PATCH] drivers/scsi/scsi_debug.c: add missing vfrees
Message-Id: <1335730484-21083-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Free dif_storep and fake_storep on failure as done in nearby error-handling
code.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/scsi_debug.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 182d5a5..16e44f8 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -3393,7 +3393,8 @@ static int __init scsi_debug_init(void)
 			printk(KERN_ERR
 			       "%s: ERR: unmap_granularity < unmap_alignment\n",
 			       __func__);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_vm;
 		}
 
 		map_size = (sdebug_store_sectors / scsi_debug_unmap_granularity);

