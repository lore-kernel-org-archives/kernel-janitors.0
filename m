From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 07:56:25 +0000
Subject: [patch 2/4] skd: use after free bugs in debug code
Message-Id: <20130913075625.GF19211@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We've freed "skdev" but the debug code dereferences it.  I've just
removed the printk() entirely.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index dfd05a9..f892d95 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -4919,8 +4919,6 @@ static void skd_destruct(struct skd_device *skdev)
 
 	VPRINTK(skdev, "skdev\n");
 	kfree(skdev);
-
-	DPRINTK(skdev, "VICTORY\n");
 }
 
 static void skd_free_skcomp(struct skd_device *skdev)
