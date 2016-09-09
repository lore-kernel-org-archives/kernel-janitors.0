From: Kuppuswamy Sathyanarayanan  <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Fri, 09 Sep 2016 02:07:08 +0000
Subject: [PATCH v3 1/3] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <ee8b3baa53bd44504b5448a790fb15750f90675b.1473386382.git.sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andriy.shevchenko@linux.intel.com, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com, sathyanarayanan.kuppuswamy@linux.intel.com

According to the intel_mid_sfi_get_pdata() definition,
get_platform_data() should return NULL on no platform
data scenario and return ERR_PTR on platform data
initialization failures. But current device platform
initialization code does not follow this requirement.
This patch fixes the return values issues in various SFI
device libs code.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 arch/x86/platform/intel-mid/device_libs/platform_lis331.c    | 4 ++--
 arch/x86/platform/intel-mid/device_libs/platform_max7315.c   | 2 +-
 arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c   | 2 +-
 arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
index a35cf91..8be5d40 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
@@ -22,9 +22,9 @@ static void __init *lis331dl_platform_data(void *info)
 	int intr2nd = get_gpio_by_name("accel_2");
 
 	if (intr < 0)
-		return NULL;
+		return ERR_PTR(intr);
 	if (intr2nd < 0)
-		return NULL;
+		ERR_PTR(intr2nd);
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
 	intr2nd_pdata = intr2nd + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
index 6e075af..34dc59d 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
@@ -31,7 +31,7 @@ static void __init *max7315_platform_data(void *info)
 	if (nr = MAX7315_NUM) {
 		pr_err("too many max7315s, we only support %d\n",
 				MAX7315_NUM);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 	/* we have several max7315 on the board, we only need load several
 	 * instances of the same pca953x driver to cover them
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
index ee22864..f434f88 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
@@ -20,7 +20,7 @@ static void *mpu3050_platform_data(void *info)
 	int intr = get_gpio_by_name("mpu3050_int");
 
 	if (intr < 0)
-		return NULL;
+		return ERR_PTR(intr);
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
 	return NULL;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
index 429a941..563f77f 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
@@ -47,7 +47,7 @@ static void __init *pcal9555a_platform_data(void *info)
 	if (nr >= PCAL9555A_NUM) {
 		pr_err("%s: Too many instances, only %d supported\n", __func__,
 		       PCAL9555A_NUM);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	pcal9555a = &pcal9555a_pdata[nr++];
-- 
2.7.4

