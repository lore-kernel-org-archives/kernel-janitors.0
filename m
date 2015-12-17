From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2015 12:27:07 +0000
Subject: [patch]  VFIO: platform: reset: fix a warning message condition
Message-Id: <20151217122707.GA4267@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Baptiste Reynal <b.reynal@virtualopensystems.com>, Eric Auger <eric.auger@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This loop ends with count set to -1 and not zero so the warning message
isn't printed when it should be.  I've fixed this by change the postop
to a preop.

Fixes: 0990822c9866 ('VFIO: platform: reset: AMD xgbe reset module')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
index da5356f..d4030d0 100644
--- a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
+++ b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
@@ -110,7 +110,7 @@ int vfio_platform_amdxgbe_reset(struct vfio_platform_device *vdev)
 	usleep_range(10, 15);
 
 	count = 2000;
-	while (count-- && (ioread32(xgmac_regs->ioaddr + DMA_MR) & 1))
+	while (--count && (ioread32(xgmac_regs->ioaddr + DMA_MR) & 1))
 		usleep_range(500, 600);
 
 	if (!count)
