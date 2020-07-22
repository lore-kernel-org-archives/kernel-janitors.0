From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 15:44:04 +0000
Subject: [PATCH] scsi: libsas: remove redundant assignment to variable res
Message-Id: <20200722154404.959267-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, John Garry <john.garry@huawei.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable res is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/libsas/sas_expander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/libsas/sas_expander.c b/drivers/scsi/libsas/sas_expander.c
index ab671cdd4cfb..b7d1b1ea185d 100644
--- a/drivers/scsi/libsas/sas_expander.c
+++ b/drivers/scsi/libsas/sas_expander.c
@@ -427,7 +427,7 @@ int sas_ex_phy_discover(struct domain_device *dev, int single)
 static int sas_expander_discover(struct domain_device *dev)
 {
 	struct expander_device *ex = &dev->ex_dev;
-	int res = -ENOMEM;
+	int res;
 
 	ex->ex_phy = kcalloc(ex->num_phys, sizeof(*ex->ex_phy), GFP_KERNEL);
 	if (!ex->ex_phy)
-- 
2.27.0
