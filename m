From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Dec 2020 17:20:19 +0000
Subject: [PATCH] mpt3sas: fix spelling mistake in Kconfig: "compatiblity" -> "compatibility"
Message-Id: <20201217172019.57768-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/mpt3sas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/Kconfig b/drivers/scsi/mpt3sas/Kconfig
index 86209455172d..c299f7e078fb 100644
--- a/drivers/scsi/mpt3sas/Kconfig
+++ b/drivers/scsi/mpt3sas/Kconfig
@@ -79,5 +79,5 @@ config SCSI_MPT2SAS
 	select SCSI_MPT3SAS
 	depends on PCI && SCSI
 	help
-	Dummy config option for backwards compatiblity: configure the MPT3SAS
+	Dummy config option for backwards compatibility: configure the MPT3SAS
 	driver instead.
-- 
2.29.2
