From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 04 Sep 2018 03:36:01 +0000
Subject: [PATCH -next] scsi: aic7xxx: remove set but not used variable 'shared_scb_data'
Message-Id: <1536032161-124423-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/aic7xxx/aic79xx_pci.c: In function 'ahd_pci_config':
drivers/scsi/aic7xxx/aic79xx_pci.c:291:19: warning:
 variable 'shared_scb_data' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/aic7xxx/aic79xx_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_pci.c b/drivers/scsi/aic7xxx/aic79xx_pci.c
index c68943b..8397ae9 100644
--- a/drivers/scsi/aic7xxx/aic79xx_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_pci.c
@@ -288,13 +288,11 @@ static void	ahd_configure_termination(struct ahd_softc *ahd,
 int
 ahd_pci_config(struct ahd_softc *ahd, const struct ahd_pci_identity *entry)
 {
-	struct scb_data *shared_scb_data;
 	u_int		 command;
 	uint32_t	 devconfig;
 	uint16_t	 subvendor; 
 	int		 error;
 
-	shared_scb_data = NULL;
 	ahd->description = entry->name;
 	/*
 	 * Record if this is an HP board.
