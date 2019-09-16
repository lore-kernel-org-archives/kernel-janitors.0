From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Sep 2019 09:17:06 +0000
Subject: [PATCH][next] scsi: hisi_sas: fix spelling mistake "digial" -> "digital"
Message-Id: <20190916091706.32268-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Garry <john.garry@huawei.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/hisi_sas/hisi_sas_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index d1513fdf1e00..e934d0b11745 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -3539,7 +3539,7 @@ static const struct {
 	int		value;
 	char		*name;
 } hisi_sas_debugfs_loop_modes[] = {
-	{ HISI_SAS_BIST_LOOPBACK_MODE_DIGITAL, "digial" },
+	{ HISI_SAS_BIST_LOOPBACK_MODE_DIGITAL, "digital" },
 	{ HISI_SAS_BIST_LOOPBACK_MODE_SERDES, "serdes" },
 	{ HISI_SAS_BIST_LOOPBACK_MODE_REMOTE, "remote" },
 };
-- 
2.20.1
