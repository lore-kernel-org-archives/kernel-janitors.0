From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:57:45 +0000
Subject: [patch] skd: remove unneeded NULL check in skd_acquire_msix()
Message-Id: <20140130115745.GH12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kfree() takes NULL pointers and also the variable can never be NULL
here anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index eb6e1e0e8db2..5ca729e6f644 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -4013,8 +4013,7 @@ static int skd_acquire_msix(struct skd_device *skdev)
 	return 0;
 
 msix_out:
-	if (entries)
-		kfree(entries);
+	kfree(entries);
 	skd_release_msix(skdev);
 	return rc;
 }
