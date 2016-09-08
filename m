From: Kuppuswamy Sathyanarayanan  <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Thu, 08 Sep 2016 00:05:03 +0000
Subject: [PATCH v2 1/1] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <1473293103-78682-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andriy.shevchenko@linux.intel.com, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com, sathyanarayanan.kuppuswamy@linux.intel.com

According to the intel_mid_sfi_get_pdata() function definition,
get_platform_data() function should returns NULL on no platform
data scenario and return ERR_PTR on platform data initialization
failures. But current device platform initialization code does not
follow this requirement. This patch fixes the return values issues
in various sfi device libs code.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 .../intel-mid/device_libs/platform_lis331.c        | 22 ++++++++++++++++------
 .../intel-mid/device_libs/platform_max7315.c       | 12 ++++++++----
 .../intel-mid/device_libs/platform_mpu3050.c       | 12 +++++++++---
 .../intel-mid/device_libs/platform_pcal9555a.c     |  7 +++++--
 .../intel-mid/device_libs/platform_tca6416.c       |  6 +++++-
 arch/x86/platform/intel-mid/sfi.c                  | 21 +++++++++++++++++----
 6 files changed, 60 insertions(+), 20 deletions(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
index a35cf91..393c23e 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
@@ -14,17 +14,27 @@
 #include <linux/gpio.h>
 #include <asm/intel-mid.h>
 
+#define LIS331DL_ACCEL_INT1	"accel_int"
+#define LIS331DL_ACCEL_INT2	"accel_2"
+
 static void __init *lis331dl_platform_data(void *info)
 {
 	static short intr2nd_pdata;
 	struct i2c_board_info *i2c_info = info;
-	int intr = get_gpio_by_name("accel_int");
-	int intr2nd = get_gpio_by_name("accel_2");
+	int intr = get_gpio_by_name(LIS331DL_ACCEL_INT1);
+	int intr2nd = get_gpio_by_name(LIS331DL_ACCEL_INT2);
+
+	if (intr < 0) {
+		pr_err("%s: Can't find %s GPIO interrupt\n", __func__,
+		       LIS331DL_ACCEL_INT1);
+		return ERR_PTR(intr);
+	}
 
-	if (intr < 0)
-		return NULL;
-	if (intr2nd < 0)
-		return NULL;
+	if (intr2nd < 0) {
+		pr_err("%s: Can't find %s GPIO interrupt\n", __func__,
+		       LIS331DL_ACCEL_INT2);
+		return ERR_PTR(intr2nd);
+	}
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
 	intr2nd_pdata = intr2nd + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
index 6e075af..2cd3c7f 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
@@ -29,9 +29,9 @@ static void __init *max7315_platform_data(void *info)
 	char intr_pin_name[SFI_NAME_LEN + 1];
 
 	if (nr = MAX7315_NUM) {
-		pr_err("too many max7315s, we only support %d\n",
-				MAX7315_NUM);
-		return NULL;
+		pr_err("%s: too many max7315s, we only support %d\n",
+		       __func__, MAX7315_NUM);
+		return ERR_PTR(-ENOMEM);
 	}
 	/* we have several max7315 on the board, we only need load several
 	 * instances of the same pca953x driver to cover them
@@ -48,8 +48,12 @@ static void __init *max7315_platform_data(void *info)
 	gpio_base = get_gpio_by_name(base_pin_name);
 	intr = get_gpio_by_name(intr_pin_name);
 
-	if (gpio_base < 0)
+	if (gpio_base < 0) {
+		pr_err("%s: Unknown GPIO base number, falling back to"
+		       "dynamic allocation\n", __func__);
 		return NULL;
+	}
+
 	max7315->gpio_base = gpio_base;
 	if (intr != -1) {
 		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
index ee22864..4b33aab 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
@@ -14,15 +14,21 @@
 #include <linux/i2c.h>
 #include <asm/intel-mid.h>
 
+#define MPU3050_INT		"mpu3050_int"
+
 static void *mpu3050_platform_data(void *info)
 {
 	struct i2c_board_info *i2c_info = info;
-	int intr = get_gpio_by_name("mpu3050_int");
+	int intr = get_gpio_by_name(MPU3050_INT);
 
-	if (intr < 0)
-		return NULL;
+	if (intr < 0) {
+		pr_err("%s: Can't find %s GPIO interrupt\n", __func__,
+		       MPU3050_INT);
+		return ERR_PTR(intr);
+	}
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
+
 	return NULL;
 }
 
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
index 429a941..190b2d2 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
@@ -41,13 +41,16 @@ static void __init *pcal9555a_platform_data(void *info)
 	intr = get_gpio_by_name(intr_pin_name);
 
 	/* Check if the SFI record valid */
-	if (gpio_base = -1)
+	if (gpio_base = -1) {
+		pr_err("%s: Unknown GPIO base number, falling back to dynamic"
+		       "allocation\n", __func__);
 		return NULL;
+	}
 
 	if (nr >= PCAL9555A_NUM) {
 		pr_err("%s: Too many instances, only %d supported\n", __func__,
 		       PCAL9555A_NUM);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	pcal9555a = &pcal9555a_pdata[nr++];
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
index 4f41372..145b03d 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
@@ -34,8 +34,12 @@ static void *tca6416_platform_data(void *info)
 	gpio_base = get_gpio_by_name(base_pin_name);
 	intr = get_gpio_by_name(intr_pin_name);
 
-	if (gpio_base < 0)
+	if (gpio_base < 0) {
+		pr_err("%s: Unknown GPIO base number, falling back to dynamic"
+		       "allocation\n", __func__);
 		return NULL;
+	}
+
 	tca6416.gpio_base = gpio_base;
 	if (intr >= 0) {
 		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/sfi.c b/arch/x86/platform/intel-mid/sfi.c
index 051d264..78ee7eb 100644
--- a/arch/x86/platform/intel-mid/sfi.c
+++ b/arch/x86/platform/intel-mid/sfi.c
@@ -335,9 +335,13 @@ static void __init sfi_handle_ipc_dev(struct sfi_device_table_entry *pentry,
 
 	pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
 		pentry->name, pentry->irq);
+
 	pdata = intel_mid_sfi_get_pdata(dev, pentry);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_debug("%s:  Can't get platform data for %s\n", __func__,
+			 pentry->name);
 		return;
+	}
 
 	pdev = platform_device_alloc(pentry->name, 0);
 	if (pdev = NULL) {
@@ -371,8 +375,11 @@ static void __init sfi_handle_spi_dev(struct sfi_device_table_entry *pentry,
 		spi_info.chip_select);
 
 	pdata = intel_mid_sfi_get_pdata(dev, &spi_info);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_debug("%s:  Can't get platform data for %s\n", __func__,
+			 pentry->name);
 		return;
+	}
 
 	spi_info.platform_data = pdata;
 	if (dev->delay)
@@ -398,8 +405,11 @@ static void __init sfi_handle_i2c_dev(struct sfi_device_table_entry *pentry,
 		i2c_info.addr);
 	pdata = intel_mid_sfi_get_pdata(dev, &i2c_info);
 	i2c_info.platform_data = pdata;
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_debug("%s:  Can't get platform data for %s\n", __func__,
+			 pentry->name);
 		return;
+	}
 
 	if (dev->delay)
 		intel_scu_i2c_device_register(pentry->host_num, &i2c_info);
@@ -424,8 +434,11 @@ static void __init sfi_handle_sd_dev(struct sfi_device_table_entry *pentry,
 		 sd_info.max_clk,
 		 sd_info.addr);
 	pdata = intel_mid_sfi_get_pdata(dev, &sd_info);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_debug("%s:  Can't get platform data for %s\n", __func__,
+			 pentry->name);
 		return;
+	}
 
 	/* Nothing we can do with this for now */
 	sd_info.platform_data = pdata;
-- 
2.7.4

