From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Sep 2018 14:36:56 +0000
Subject: [PATCH] scsi: aic7xxx: remove unused redundant variable num_chip_names
Message-Id: <20180904143656.3504-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable num_chip_names is defined but not used, hence it is
redundant and can be removed.

Cleans up clang warning:
'num_chip_names' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/aic7xxx/aic79xx_core.c | 1 -
 drivers/scsi/aic7xxx/aic7xxx_core.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 8e57a1dacb6a..9ee75c9a9aa1 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -52,7 +52,6 @@ static const char *const ahd_chip_names[]  	"aic7902",
 	"aic7901A"
 };
-static const u_int num_chip_names = ARRAY_SIZE(ahd_chip_names);
 
 /*
  * Hardware error codes.
diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic7xxx_core.c
index aa4eaa4fa23a..f3362f4ab16e 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_core.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
@@ -61,7 +61,6 @@ static const char *const ahc_chip_names[] = {
 	"aic7892",
 	"aic7899"
 };
-static const u_int num_chip_names = ARRAY_SIZE(ahc_chip_names);
 
 /*
  * Hardware error codes.
-- 
2.17.1
