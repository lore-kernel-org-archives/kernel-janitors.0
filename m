From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 14:41:22 +0000
Subject: [PATCH] sunvdc: Delete an error message for a failed memory allocation in vdc_port_probe()
Message-Id: <df7463db-10cd-4955-da64-0fb4e356c00e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 16:28:54 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/sunvdc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 6b16ead1da58..34f8619d6597 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -894,9 +894,8 @@ static int vdc_port_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	}
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
-	err = -ENOMEM;
 	if (!port) {
-		printk(KERN_ERR PFX "Cannot allocate vdc_port.\n");
+		err = -ENOMEM;
 		goto err_out_release_mdesc;
 	}
 
-- 
2.13.4

