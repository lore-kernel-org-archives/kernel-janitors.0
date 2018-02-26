From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Feb 2018 14:51:19 +0000
Subject: [PATCH] hwrng: cavium: make two functions static
Message-Id: <20180226145119.6001-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions cavium_rng_remove and cavium_rng_remove_vf are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
drivers/char/hw_random/cavium-rng-vf.c:80:7: warning: symbol
'cavium_rng_remove_vf' was not declared. Should it be static?
drivers/char/hw_random/cavium-rng.c:65:7: warning: symbol
'cavium_rng_remove' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/hw_random/cavium-rng-vf.c | 2 +-
 drivers/char/hw_random/cavium-rng.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/cavium-rng-vf.c b/drivers/char/hw_random/cavium-rng-vf.c
index dd1007aecb10..2d1352b67168 100644
--- a/drivers/char/hw_random/cavium-rng-vf.c
+++ b/drivers/char/hw_random/cavium-rng-vf.c
@@ -77,7 +77,7 @@ static int cavium_rng_probe_vf(struct	pci_dev		*pdev,
 }
 
 /* Remove the VF */
-void  cavium_rng_remove_vf(struct pci_dev *pdev)
+static void  cavium_rng_remove_vf(struct pci_dev *pdev)
 {
 	struct cavium_rng *rng;
 
diff --git a/drivers/char/hw_random/cavium-rng.c b/drivers/char/hw_random/cavium-rng.c
index a944e0a47f42..63d6e68c24d2 100644
--- a/drivers/char/hw_random/cavium-rng.c
+++ b/drivers/char/hw_random/cavium-rng.c
@@ -62,7 +62,7 @@ static int cavium_rng_probe(struct pci_dev *pdev,
 }
 
 /* Disable VF and RNG Hardware */
-void  cavium_rng_remove(struct pci_dev *pdev)
+static void cavium_rng_remove(struct pci_dev *pdev)
 {
 	struct cavium_rng_pf *rng;
 
-- 
2.15.1

