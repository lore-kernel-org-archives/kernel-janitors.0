From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 09 Sep 2016 11:27:45 +0000
Subject: Re: [PATCH v3 2/3] intel-mid: Add valid error messages on init failure
Message-Id: <1473420465.11323.126.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
         <9b3987cc6560a1171809103e87e700d68c9a6b65.1473386382.git.sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <9b3987cc6560a1171809103e87e700d68c9a6b65.1473386382.git.sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com

On Thu, 2016-09-08 at 19:07 -0700, Kuppuswamy Sathyanarayanan wrote:
> Added valid error/warning messages to platform data
> initalization failures in SFI device libs code.

Looks good to me after addressing the following comments.

> 
> diff --git a/arch/x86/platform/intel-
> mid/device_libs/platform_emc1403.c b/arch/x86/platform/intel-
> mid/device_libs/platform_emc1403.c
> index c259fb6..bd776b04 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_emc1403.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_emc1403.c
> @@ -15,17 +15,27 @@
>  #include <linux/i2c.h>
>  #include <asm/intel-mid.h>
>  
> +#define EMC1403_THERMAL_INT		"thermal_int"
> +#define EMC1403_THERMAL_ALERT_INT	"thermal_alert"

I would be cosistent, i.e.
EMC1403_INT1  "..."
EMC1403_INT2  "..."

> +
>  static void __init *emc1403_platform_data(void *info)
>  {
>  	static short intr2nd_pdata;
>  	struct i2c_board_info *i2c_info = info;
> -	int intr = get_gpio_by_name("thermal_int");
> -	int intr2nd = get_gpio_by_name("thermal_alert");
> +	int intr = get_gpio_by_name(EMC1403_THERMAL_INT);
> +	int intr2nd = get_gpio_by_name(EMC1403_THERMAL_ALERT_INT);
>  
> -	if (intr < 0)
> +	if (intr < 0) {
> +		pr_err("%s: Can't find %s GPIO interrupt\n",
> __func__,
> +		       EMC1403_THERMAL_INT);
>  		return NULL;

Souldn't we return an error here?

> -	if (intr2nd < 0)
> +	}
> +
> +	if (intr2nd < 0) {
> +		pr_err("%s: Can't find %s GPIO interrupt\n",
> __func__,
> +		       EMC1403_THERMAL_ALERT_INT);
>  		return NULL;

Ditto.

Would you check _all_ files under device libs?

> +	}
>  
>  	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>  	intr2nd_pdata = intr2nd + INTEL_MID_IRQ_OFFSET;
> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_ipc.c
> b/arch/x86/platform/intel-mid/device_libs/platform_ipc.c
> index a84b73d..6704694 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_ipc.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_ipc.c
> @@ -42,8 +42,11 @@ void __init ipc_device_handler(struct
> sfi_device_table_entry *pentry,
>  	 * On Medfield the platform device creation is handled by the
> MSIC
>  	 * MFD driver so we don't need to do it here.
>  	 */
> -	if (intel_mid_has_msic())
> +	if (intel_mid_has_msic()) {
> +		pr_err("%s: device %s will be handled by MSIC mfd
> driver\n",

Remove "mfd" word.

> +		       __func__, pentry->name);
>  		return;
> +	}
>  
>  	pdev = platform_device_alloc(pentry->name, 0);
>  	if (pdev = NULL) {
> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c 
> b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
> index 8be5d40..393c23e 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
> @@ -14,17 +14,27 @@
>  #include <linux/gpio.h>
>  #include <asm/intel-mid.h>
>  
> +#define LIS331DL_ACCEL_INT1	"accel_int"
> +#define LIS331DL_ACCEL_INT2	"accel_2"

LIS331DL_INT1
LIS331DL_INT2

> @@ -48,8 +48,12 @@ static void __init *max7315_platform_data(void
> *info)
>  	gpio_base = get_gpio_by_name(base_pin_name);
>  	intr = get_gpio_by_name(intr_pin_name);
>  
> -	if (gpio_base < 0)
> +	if (gpio_base < 0) {
> +		pr_warn("%s: falling back to dynamic gpio
> allocation\n",
> +			__func__);
>  		return NULL;

Depends on my comment to the previous series.

> --- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
> @@ -14,13 +14,18 @@
>  #include <linux/i2c.h>
>  #include <asm/intel-mid.h>
>  
> +#define MPU3050_INT		"mpu3050_int"

MPU3050_INT1

> mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-
> mid/device_libs/platform_pcal9555a.c
> index 563f77f..cde764e 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
> @@ -41,8 +41,11 @@ static void __init *pcal9555a_platform_data(void
> *info)
>  	intr = get_gpio_by_name(intr_pin_name);
>  
>  	/* Check if the SFI record valid */
> -	if (gpio_base = -1)
> +	if (gpio_base = -1) {
> +		pr_warn("%s: falling back to dynamic gpio
> allocation\n",
> +			__func__);
>  		return NULL;

Same as above

> mid/device_libs/platform_tca6416.c b/arch/x86/platform/intel-
> mid/device_libs/platform_tca6416.c
> index 4f41372..4d4393e 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
> @@ -34,8 +34,12 @@ static void *tca6416_platform_data(void *info)
>  	gpio_base = get_gpio_by_name(base_pin_name);
>  	intr = get_gpio_by_name(intr_pin_name);
>  
> -	if (gpio_base < 0)
> +	if (gpio_base < 0) {
> +		pr_warn("%s: falling back to dynamic gpio
> allocation\n",
> +			__func__);
>  		return NULL;

Same as above

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
