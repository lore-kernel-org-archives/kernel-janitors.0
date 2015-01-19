From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 14:42:37 +0000
Subject: [patch] be2iscsi: return correct error code in beiscsi_init_port()
Message-Id: <20150119144237.GD19086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jayamohan Kallickal <jayamohan.kallickal@emulex.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

If hba_setup_cid_tbls() fails then this code should return an error code
but instead the current code returns zero (success).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index f319340..fe59ae6 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -4458,7 +4458,8 @@ static int beiscsi_init_port(struct beiscsi_hba *phba)
 		goto do_cleanup_ctrlr;
 	}
 
-	if (hba_setup_cid_tbls(phba)) {
+	ret = hba_setup_cid_tbls(phba);
+	if (ret < 0) {
 		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
 			    "BM_%d : Failed in hba_setup_cid_tbls\n");
 		kfree(phba->io_sgl_hndl_base);
