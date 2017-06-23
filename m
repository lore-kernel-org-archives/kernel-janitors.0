From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 15:15:44 +0000
Subject: [PATCH] scsi: hisi_sas: silence a static checker warning
Message-Id: <20170623151544.57jlfbl5apofl6hj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Garry <john.garry@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

phy->phy_type is a u64.  We only ever use the first two bits so it's a
bit over kill perhaps.  Anyway, let's declare the flags as ULL as well
because that lets us do things like "phy->phy_type &= ~PORT_TYPE_SAS;".
In the current code, static checkers complain that that would
unintentionally clear the high 32 bits as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/hisi_sas/hisi_sas.h b/drivers/scsi/hisi_sas/hisi_sas.h
index 4fc23087a939..b23245aeab74 100644
--- a/drivers/scsi/hisi_sas/hisi_sas.h
+++ b/drivers/scsi/hisi_sas/hisi_sas.h
@@ -56,8 +56,8 @@
 struct hisi_hba;
 
 enum {
-	PORT_TYPE_SAS = (1U << 1),
-	PORT_TYPE_SATA = (1U << 0),
+	PORT_TYPE_SAS = (1ULL << 1),
+	PORT_TYPE_SATA = (1ULL << 0),
 };
 
 enum dev_status {
