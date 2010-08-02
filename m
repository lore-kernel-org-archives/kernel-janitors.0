From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 02 Aug 2010 04:43:13 +0000
Subject: [PATCH] staging/wlags49_h2: use common PCI_VENDOR/DEVICE_ID name
Message-Id: <1280724193.6102.6.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Kulikov Vasiliy <segooon@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Henk de Groot <pe1dnn@amsat.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kernelnewbies@nl.linux.org

There is a common name format for PCI_VENDOR/DEVICE_ID constants.
wlags49_h2 names doesn't fit in the standard. 
This patch change the names and also fix some style issues.

Thanks a lot,

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/wlags49_h2/wl_pci.c |   10 +++++++---
 drivers/staging/wlags49_h2/wl_pci.h |    8 ++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_pci.c b/drivers/staging/wlags49_h2/wl_pci.c
index af4f4f8..020b17a 100644
--- a/drivers/staging/wlags49_h2/wl_pci.c
+++ b/drivers/staging/wlags49_h2/wl_pci.c
@@ -117,9 +117,13 @@ enum hermes_pci_versions {
 };
 
 static struct pci_device_id wl_pci_tbl[] __devinitdata = {
-	{ WL_LKM_PCI_VENDOR_ID, WL_LKM_PCI_DEVICE_ID_0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
-    { WL_LKM_PCI_VENDOR_ID, WL_LKM_PCI_DEVICE_ID_1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
-    { WL_LKM_PCI_VENDOR_ID, WL_LKM_PCI_DEVICE_ID_2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
+	{ PCI_VENDOR_ID_WL_LKM, PCI_DEVICE_ID_WL_LKM_0,
+	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
+	{ PCI_VENDOR_ID_WL_LKM, PCI_DEVICE_ID_WL_LKM_1,
+	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
+	{ PCI_VENDOR_ID_WL_LKM, PCI_DEVICE_ID_WL_LKM_2,
+	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Agere_Systems_Mini_PCI_V1 },
+
 	{ }			/* Terminating entry */
 };
 
diff --git a/drivers/staging/wlags49_h2/wl_pci.h b/drivers/staging/wlags49_h2/wl_pci.h
index 18d7b51..cea04c4 100644
--- a/drivers/staging/wlags49_h2/wl_pci.h
+++ b/drivers/staging/wlags49_h2/wl_pci.h
@@ -67,10 +67,10 @@
 /*******************************************************************************
  *  constant definitions
  ******************************************************************************/
-#define WL_LKM_PCI_VENDOR_ID    0x11C1  // Lucent Microelectronics
-#define WL_LKM_PCI_DEVICE_ID_0  0xAB30  // Mini PCI
-#define WL_LKM_PCI_DEVICE_ID_1  0xAB34  // Mini PCI
-#define WL_LKM_PCI_DEVICE_ID_2  0xAB11  // WARP CardBus
+#define PCI_VENDOR_IDWL_LKM     0x11C1  /* Lucent Microelectronics */
+#define PCI_DEVICE_ID_WL_LKM_0  0xAB30  /* Mini PCI */
+#define PCI_DEVICE_ID_WL_LKM_1  0xAB34  /* Mini PCI */
+#define PCI_DEVICE_ID_WL_LKM_2  0xAB11  /* WARP CardBus */
 
 
 
-- 
1.7.0.4



