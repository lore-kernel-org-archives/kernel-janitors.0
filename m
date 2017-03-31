From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 31 Mar 2017 01:28:54 +0000
Subject: [PATCH 1/2 V2] staging: atomisp: simplify the if condition in atomisp_freq_scaling()
Message-Id: <20170331012854.GA15866@jyoun-Latitude-E6530>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, daeseok.youn@gmail.com, alan@linux.intel.com, dan.carpenter@oracle.com, singhalsimran0@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The condition line in if-statement is needed to be shorthen to
improve readability.

Add a new definition to check the CHT with atomisp_device structure.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: replace the assigment line with macro to check CHT type.

 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c      | 3 +--
 drivers/staging/media/atomisp/pci/atomisp2/atomisp_internal.h | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index 94bc793..87224d6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -261,8 +261,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 		return -EINVAL;
 	}
 
-	if ((isp->pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) =
-		ATOMISP_PCI_DEVICE_SOC_CHT && ATOMISP_USE_YUVPP(asd))
+	if (ATOMISP_IS_CHT(isp) && ATOMISP_USE_YUVPP(asd))
 		isp->dfs = &dfs_config_cht_soc;
 
 	if (isp->dfs->lowest_freq = 0 || isp->dfs->max_freq_at_vmin = 0 ||
diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_internal.h
index d366713..97dc5f88 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_internal.h
@@ -72,6 +72,10 @@
 #define ATOMISP_PCI_DEVICE_SOC_ANN	0x1478
 #define ATOMISP_PCI_DEVICE_SOC_CHT	0x22b8
 
+#define ATOMISP_IS_CHT(isp) \
+	(((isp)->pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) = \
+	ATOMISP_PCI_DEVICE_SOC_CHT)
+
 #define ATOMISP_PCI_REV_MRFLD_A0_MAX	0
 #define ATOMISP_PCI_REV_BYT_A0_MAX	4
 
-- 
2.7.4

