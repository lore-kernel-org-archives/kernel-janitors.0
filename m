From: Colin King <colin.king@canonical.com>
Date: Sat, 14 Jul 2018 16:33:32 +0000
Subject: [PATCH] vme: ca91cx42: remove redundant variable i
Message-Id: <20180714163332.11600-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable i is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'i' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/vme/bridges/vme_ca91cx42.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/vme/bridges/vme_ca91cx42.c b/drivers/vme/bridges/vme_ca91cx42.c
index 5dd284008630..53bdc256805f 100644
--- a/drivers/vme/bridges/vme_ca91cx42.c
+++ b/drivers/vme/bridges/vme_ca91cx42.c
@@ -970,7 +970,6 @@ static unsigned int ca91cx42_master_rmw(struct vme_master_resource *image,
 {
 	u32 result;
 	uintptr_t pci_addr;
-	int i;
 	struct ca91cx42_driver *bridge;
 	struct device *dev;
 
@@ -978,7 +977,6 @@ static unsigned int ca91cx42_master_rmw(struct vme_master_resource *image,
 	dev = image->parent->parent;
 
 	/* Find the PCI address that maps to the desired VME address */
-	i = image->number;
 
 	/* Locking as we can only do one of these at a time */
 	mutex_lock(&bridge->vme_rmw);
-- 
2.17.1

