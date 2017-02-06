From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Feb 2017 22:00:13 +0000
Subject: [PATCH] gdrom: Add missing error code
Message-Id: <20170206220013.3851-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch@lst.de, axboe@fb.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, 'err' is known to be 0 here, because of the previous
test. Set it to a -ENOMEM instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/cdrom/gdrom.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index b6f1a5d95bc5..bc316d288f65 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -808,16 +808,20 @@ static int probe_gdrom(struct platform_device *devptr)
 	if (err)
 		goto probe_fail_cmdirq_register;
 	gd.gdrom_rq = blk_init_queue(gdrom_request, &gdrom_lock);
-	if (!gd.gdrom_rq)
+	if (!gd.gdrom_rq) {
+		err = -ENOMEM;
 		goto probe_fail_requestq;
+	}
 
 	err = probe_gdrom_setupqueue();
 	if (err)
 		goto probe_fail_toc;
 
 	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
-	if (!gd.toc)
+	if (!gd.toc) {
+		err = -ENOMEM;
 		goto probe_fail_toc;
+	}
 	add_disk(gd.disk);
 	return 0;
 
-- 
2.9.3

