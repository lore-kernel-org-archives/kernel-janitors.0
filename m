From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Mar 2018 10:33:03 +0000
Subject: [PATCH 1/2] scsi: dpt_i2o: use after free in adpt_release()
Message-Id: <20180319103303.GA8543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The scsi_host_put() function frees "pHba" and then we dereference it on
the next line when we do "scsi_host_put(pHba->host);".

Fixes: 38e09e3bb056 ("scsi: dpt_i2o: stop using scsi_unregister")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 3c667b23a801..ac2f40d9963b 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -306,8 +306,8 @@ static void adpt_release(adpt_hba *pHba)
 {
 	scsi_remove_host(pHba->host);
 //	adpt_i2o_quiesce_hba(pHba);
-	adpt_i2o_delete_hba(pHba);
 	scsi_host_put(pHba->host);
+	adpt_i2o_delete_hba(pHba);
 }
 
 
