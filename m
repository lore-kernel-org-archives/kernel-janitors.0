From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:25:56 +0000
Subject: [patch] libsrp: remove dead code
Message-Id: <20100315082556.GI18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefani Seibold <stefani@seibold.net>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@suse.de>

There was a stray kfree() left over from:
4546548789 kfifo: move struct kfifo in place

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/libsrp.c b/drivers/scsi/libsrp.c
index 2277516..c06eaeb 100644
--- a/drivers/scsi/libsrp.c
+++ b/drivers/scsi/libsrp.c
@@ -67,7 +67,6 @@ static int srp_iu_pool_alloc(struct srp_queue *q, size_t max,
 	}
 	return 0;
 
-	kfree(q->items);
 free_pool:
 	kfree(q->pool);
 	return -ENOMEM;
