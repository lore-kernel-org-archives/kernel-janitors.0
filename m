From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Apr 2013 07:13:33 +0000
Subject: [patch] [SCSI] mvsas: fix a sparse annotation
Message-Id: <20130417071332.GC7923@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Xiangliang Yu <yuxiangl@marvell.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't make sense to label a 22 bit bitfield as __le32.  It just
causes a Sparse error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mvsas/mv_94xx.h b/drivers/scsi/mvsas/mv_94xx.h
index 487aa6f..b11f90d 100644
--- a/drivers/scsi/mvsas/mv_94xx.h
+++ b/drivers/scsi/mvsas/mv_94xx.h
@@ -220,7 +220,7 @@ union reg_phy_cfg {
 
 struct mvs_prd_imt {
 #ifndef __BIG_ENDIAN
-	__le32			len:22;
+	u32			len:22;
 	u8			_r_a:2;
 	u8			misc_ctl:4;
 	u8			inter_sel:4;
