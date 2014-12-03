From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Dec 2014 10:09:41 +0000
Subject: [patch] mpt2sas: issue reset is not uninitialized
Message-Id: <20141203100941.GB29583@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>
Cc: Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The issue_reset variables were never set to zero.  This bug was found
with static analysis.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mpt2sas/mpt2sas_base.c b/drivers/scsi/mpt2sas/mpt2sas_base.c
index 58e4521..98bd546 100644
--- a/drivers/scsi/mpt2sas/mpt2sas_base.c
+++ b/drivers/scsi/mpt2sas/mpt2sas_base.c
@@ -3236,7 +3236,7 @@ mpt2sas_base_sas_iounit_control(struct MPT2SAS_ADAPTER *ioc,
 	u16 smid;
 	u32 ioc_state;
 	unsigned long timeleft;
-	u8 issue_reset;
+	bool issue_reset = 0;
 	int rc;
 	void *request;
 	u16 wait_state_count;
@@ -3341,7 +3341,7 @@ mpt2sas_base_scsi_enclosure_processor(struct MPT2SAS_ADAPTER *ioc,
 	u16 smid;
 	u32 ioc_state;
 	unsigned long timeleft;
-	u8 issue_reset;
+	bool issue_reset = 0;
 	int rc;
 	void *request;
 	u16 wait_state_count;
