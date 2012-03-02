From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 06:57:42 +0000
Subject: [patch] [SCSI] megaraid: cleanup type issue in mega_build_cmd()
Message-Id: <20120302065741.GD24508@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela Syam Kolli <megaraidlinux@lsi.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit systems the current code sets 32 bits of "seg" and leaves the
other 32 uninitialized.  It doesn't matter since the variable is never
used.  But it's still messy and we should fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index 4d39a9f..97825f1 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -524,7 +524,7 @@ mega_build_cmd(adapter_t *adapter, Scsi_Cmnd *cmd, int *busy)
 	mega_passthru	*pthru;
 	scb_t	*scb;
 	mbox_t	*mbox;
-	long	seg;
+	u32	seg;
 	char	islogical;
 	int	max_ldrv_num;
 	int	channel = 0;
@@ -858,7 +858,7 @@ mega_build_cmd(adapter_t *adapter, Scsi_Cmnd *cmd, int *busy)
 
 			/* Calculate Scatter-Gather info */
 			mbox->m_out.numsgelements = mega_build_sglist(adapter, scb,
-					(u32 *)&mbox->m_out.xferaddr, (u32 *)&seg);
+					(u32 *)&mbox->m_out.xferaddr, &seg);
 
 			return scb;
 
