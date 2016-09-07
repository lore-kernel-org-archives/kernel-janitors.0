From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
Date: Wed, 07 Sep 2016 00:51:43 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <6246daa8-75b4-cc0e-83f9-32c0c47d2e42@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------C0B73C1BB7999EB154C18815"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------C0B73C1BB7999EB154C18815
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,


On 09/01/2016 06:17 AM, Andy Shevchenko wrote:
> On Tue, 2016-08-30 at 11:18 -0700, Sathyanarayanan Kuppuswamy wrote:
>
>> IMO, Main problem here is, In some scenarios get_platform_data
>> returns
>> NULL on error case and in some cases it return NULL for no platform
>> data
>> case.
> We have possibility of the following scenarios:
> 1) fatal error (should return error code and fail booting)
> 2) non-fatal error (prevents certain device to be enumerated, pdata =
> NULL)
> 3) no pdata for the device (not an error! pdata is optional to the
> certain driver)
> 4) pdata != NULL (fully armed device driver)
>
> According to above I doubt we will have many 1) cases. Otherwise pdata =
> NULL is okay.
I agree with 2,3 and 4 scenarios. But I am not sure about the first 
case. Since these are peripheral devices, any failure in them should not 
stop the device boot. Do you have any examples for this case ?

Attached patch fixes the return value issues in get_platform_data code 
in device_libs directory. Please check and let me know your comments.

>
>> For example, in following function, returning NULL on gpio_base == -1
>> and when nr >= PCAL9555A_NUM is incorrect. I think in both these
>> scenarios valid behavior is to stop the device creation process.
> Yes, but do _not_ stop processing and booting!
>
>> Creating an i2c device without validi irq number or gpio number is
>> incorrect.
>>
>> So after investigating it bit more, I think its more appropriate to
>> fix
>> these error cases in device_libs dir. Let me know your comments.
> I doubt that is a proper fix. It might be part of the fix in sfi.c where
> you somehow distinguish fatal errors from non-fatal.
>
>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer


--------------C0B73C1BB7999EB154C18815
Content-Type: text/x-patch;
 name="0001-intel-mid-Fix-sfi-get_platform_data-return-value-iss.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-intel-mid-Fix-sfi-get_platform_data-return-value-iss.pa";
 filename*1="tch"

From c534b068dbfe26abd0a730f2c61695fbccd6964a Mon Sep 17 00:00:00 2001
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Tue, 6 Sep 2016 16:42:15 -0700
Subject: [PATCH 1/1] intel-mid: Fix sfi get_platform_data() return value
 issues

According to the intel_mid_sfi_get_pdata() function definition,
get_platform_data() function should returns NULL on no platform
data scenario and return ERR_PTR on platform data initialization
failures. But current device platform initialization code does not
follow this requirement. This patch fixes the return values issues
in various sfi device libs code.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 .../platform/intel-mid/device_libs/platform_lis331.c    | 13 +++++++++----
 .../platform/intel-mid/device_libs/platform_max7315.c   |  9 ++++++---
 .../platform/intel-mid/device_libs/platform_mpu3050.c   |  7 +++++--
 .../platform/intel-mid/device_libs/platform_pcal9555a.c |  8 +++++---
 .../platform/intel-mid/device_libs/platform_tca6416.c   |  7 +++++--
 arch/x86/platform/intel-mid/sfi.c                       | 17 +++++++++++++----
 6 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
index a35cf91..2fd200b 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
@@ -21,10 +21,15 @@ static void __init *lis331dl_platform_data(void *info)
 	int intr = get_gpio_by_name("accel_int");
 	int intr2nd = get_gpio_by_name("accel_2");
 
-	if (intr < 0)
-		return NULL;
-	if (intr2nd < 0)
-		return NULL;
+	if (intr < 0) {
+		pr_err("%s: invalid interrupt1 error\n", __func__);
+		return ERR_PTR(intr);
+	}
+
+	if (intr2nd < 0) {
+		pr_err("%s: invalid interrupt2 error\n", __func__);
+		return ERR_PTR(intr2nd);
+	}
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
 	intr2nd_pdata = intr2nd + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
index 6e075af..cc20dfc 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
@@ -31,7 +31,7 @@ static void __init *max7315_platform_data(void *info)
 	if (nr == MAX7315_NUM) {
 		pr_err("too many max7315s, we only support %d\n",
 				MAX7315_NUM);
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
 	/* we have several max7315 on the board, we only need load several
 	 * instances of the same pca953x driver to cover them
@@ -48,8 +48,11 @@ static void __init *max7315_platform_data(void *info)
 	gpio_base = get_gpio_by_name(base_pin_name);
 	intr = get_gpio_by_name(intr_pin_name);
 
-	if (gpio_base < 0)
-		return NULL;
+	if (gpio_base < 0) {
+		pr_err("%s: invalid gpio base error\n", __func__);
+		return ERR_PTR(gpio_base);
+	}
+
 	max7315->gpio_base = gpio_base;
 	if (intr != -1) {
 		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
index ee22864..2008824 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
@@ -19,10 +19,13 @@ static void *mpu3050_platform_data(void *info)
 	struct i2c_board_info *i2c_info = info;
 	int intr = get_gpio_by_name("mpu3050_int");
 
-	if (intr < 0)
-		return NULL;
+	if (intr < 0) {
+		pr_err("%s: invalid interrupt error\n", __func__);
+		return ERR_PTR(intr);
+	}
 
 	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
+
 	return NULL;
 }
 
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
index 429a941..97e92a2 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
@@ -41,13 +41,15 @@ static void __init *pcal9555a_platform_data(void *info)
 	intr = get_gpio_by_name(intr_pin_name);
 
 	/* Check if the SFI record valid */
-	if (gpio_base == -1)
-		return NULL;
+	if (gpio_base == -1) {
+		pr_err("%s: invalid gpio base error\n", __func__);
+		return ERR_PTR(gpio_base);
+	}
 
 	if (nr >= PCAL9555A_NUM) {
 		pr_err("%s: Too many instances, only %d supported\n", __func__,
 		       PCAL9555A_NUM);
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
 
 	pcal9555a = &pcal9555a_pdata[nr++];
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
index 4f41372..2796956 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
@@ -34,8 +34,11 @@ static void *tca6416_platform_data(void *info)
 	gpio_base = get_gpio_by_name(base_pin_name);
 	intr = get_gpio_by_name(intr_pin_name);
 
-	if (gpio_base < 0)
-		return NULL;
+	if (gpio_base < 0) {
+		pr_err("%s: invalid gpio base error\n", __func__);
+		return ERR_PTR(gpio_base);
+	}
+
 	tca6416.gpio_base = gpio_base;
 	if (intr >= 0) {
 		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
diff --git a/arch/x86/platform/intel-mid/sfi.c b/arch/x86/platform/intel-mid/sfi.c
index 051d264..8e7361f 100644
--- a/arch/x86/platform/intel-mid/sfi.c
+++ b/arch/x86/platform/intel-mid/sfi.c
@@ -335,9 +335,12 @@ static void __init sfi_handle_ipc_dev(struct sfi_device_table_entry *pentry,
 
 	pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
 		pentry->name, pentry->irq);
+
 	pdata = intel_mid_sfi_get_pdata(dev, pentry);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_err("ipc_device: %s: invalid platform data\n", pentry->name);
 		return;
+	}
 
 	pdev = platform_device_alloc(pentry->name, 0);
 	if (pdev == NULL) {
@@ -371,8 +374,10 @@ static void __init sfi_handle_spi_dev(struct sfi_device_table_entry *pentry,
 		spi_info.chip_select);
 
 	pdata = intel_mid_sfi_get_pdata(dev, &spi_info);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_err("spi_device: %s: invalid platform data\n", pentry->name);
 		return;
+	}
 
 	spi_info.platform_data = pdata;
 	if (dev->delay)
@@ -398,8 +403,10 @@ static void __init sfi_handle_i2c_dev(struct sfi_device_table_entry *pentry,
 		i2c_info.addr);
 	pdata = intel_mid_sfi_get_pdata(dev, &i2c_info);
 	i2c_info.platform_data = pdata;
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_err("i2c_device: %s: invalid platform data\n", pentry->name);
 		return;
+	}
 
 	if (dev->delay)
 		intel_scu_i2c_device_register(pentry->host_num, &i2c_info);
@@ -424,8 +431,10 @@ static void __init sfi_handle_sd_dev(struct sfi_device_table_entry *pentry,
 		 sd_info.max_clk,
 		 sd_info.addr);
 	pdata = intel_mid_sfi_get_pdata(dev, &sd_info);
-	if (IS_ERR(pdata))
+	if (IS_ERR(pdata)) {
+		pr_err("sd_device: %s: invalid platform data\n", pentry->name);
 		return;
+	}
 
 	/* Nothing we can do with this for now */
 	sd_info.platform_data = pdata;
-- 
2.7.4


--------------C0B73C1BB7999EB154C18815--
