From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Aug 2018 09:23:01 +0000
Subject: [PATCH] scsi: aacraid: fix a signednes bug
Message-Id: <20180827092301.xtbunhvpl3ht2mjx@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The problem is that ->reset_state is a u8 but it can be set to -1 or -2
in aac_tmf_callback() and the error handling in aac_eh_target_reset()
relies on it to be signed.

Fixes: 0d643ff3c353 ("scsi: aacraid: use aac_tmf_callback for reset fib")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/aacraid/aacraid.h b/drivers/scsi/aacraid/aacraid.h
index 29bf1e60f542..39eb415987fc 100644
--- a/drivers/scsi/aacraid/aacraid.h
+++ b/drivers/scsi/aacraid/aacraid.h
@@ -1346,7 +1346,7 @@ struct fib {
 struct aac_hba_map_info {
 	__le32	rmw_nexus;		/* nexus for native HBA devices */
 	u8		devtype;	/* device type */
-	u8		reset_state;	/* 0 - no reset, 1..x - */
+	s8		reset_state;	/* 0 - no reset, 1..x - */
 					/* after xth TM LUN reset */
 	u16		qd_limit;
 	u32		scan_counter;
