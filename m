From: sathyanarayanan kuppuswamy  <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Thu, 08 Sep 2016 00:04:48 +0000
Subject: Re: [PATCH 1/1] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <71e4231f-33dc-9a95-c748-89bc5ec322d5@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a42b4af5-e2a5-d922-b5a5-ab177bb15140@intel.com>
 <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
 <1473250509.11323.60.camel@linux.intel.com>
In-Reply-To: <1473250509.11323.60.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com



On 09/07/2016 05:15 AM, Andy Shevchenko wrote:
> On Tue, 2016-09-06 at 18:04 -0700, Kuppuswamy Sathyanarayanan wrote:
>> According to the intel_mid_sfi_get_pdata() function definition,
>> get_platform_data() function should returns NULL on no platform
>> data scenario and return ERR_PTR on platform data initialization
>> failures. But current device platform initialization code does not
>> follow this requirement. This patch fixes the return values issues
>> in various sfi device libs code.
> I'm fine with this as long as it doesn't prevent booting.
>
> See also comments below.
Thanks for the review. Please find my comments inline.
>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@
>> linux.intel.com>
>> ---
>>   .../platform/intel-mid/device_libs/platform_lis331.c    | 13
>> +++++++++----
>>   .../platform/intel-mid/device_libs/platform_max7315.c   |  9 ++++++
>> ---
>>   .../platform/intel-mid/device_libs/platform_mpu3050.c   |  7 +++++--
>>   .../platform/intel-mid/device_libs/platform_pcal9555a.c |  8 +++++---
>>   .../platform/intel-mid/device_libs/platform_tca6416.c   |  7 +++++--
>>   arch/x86/platform/intel-mid/sfi.c                       | 17
>> +++++++++++++----
>>   6 files changed, 43 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
>> b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
>> index a35cf91..2fd200b 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_lis331.c
>> @@ -21,10 +21,15 @@ static void __init *lis331dl_platform_data(void
>> *info)
>>   	int intr = get_gpio_by_name("accel_int");
>>   	int intr2nd = get_gpio_by_name("accel_2");
>>   
>> -	if (intr < 0)
>> -		return NULL;
>> -	if (intr2nd < 0)
>> -		return NULL;
>> +	if (intr < 0) {
>> +		pr_err("%s: invalid interrupt1 error\n", __func__);
> I would rephrase to something like
>
> #define LIS331DL_ACCEL_INT	"accel_int"
>
> ...
>
> pr_err("%s: Can't find %s GPIO interrupt\n", __func__,
> LIS331DL_ACCEL_INT);
>
Agreed. Will be fixed in next patch version.
>> +		return ERR_PTR(intr);
>> +	}
>> +
>> +	if (intr2nd < 0) {
>> +		pr_err("%s: invalid interrupt2 error\n", __func__);
> Ditto.
Agreed. Will be fixed in next patch version.
>
>> +		return ERR_PTR(intr2nd);
>> +	}
>>   
>>   	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>>   	intr2nd_pdata = intr2nd + INTEL_MID_IRQ_OFFSET;
>> diff --git a/arch/x86/platform/intel-
>> mid/device_libs/platform_max7315.c b/arch/x86/platform/intel-
>> mid/device_libs/platform_max7315.c
>> index 6e075af..cc20dfc 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
>> @@ -31,7 +31,7 @@ static void __init *max7315_platform_data(void
>> *info)
>>   	if (nr = MAX7315_NUM) {
>>   		pr_err("too many max7315s, we only support %d\n",
>>   				MAX7315_NUM);
> "%s: too many instances, we only support %d\n", __func__, MAX7315_NUM
>
>> -		return NULL;
>> +		return ERR_PTR(-ENODEV);
> -ENOMEM
Agreed. Will be fixed in next patch version.
>
>>   	}
>>   	/* we have several max7315 on the board, we only need load
>> several
>>   	 * instances of the same pca953x driver to cover them
>> @@ -48,8 +48,11 @@ static void __init *max7315_platform_data(void
>> *info)
>>   	gpio_base = get_gpio_by_name(base_pin_name);
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>> -	if (gpio_base < 0)
>> -		return NULL;
>> +	if (gpio_base < 0) {
>> +		pr_err("%s: invalid gpio base error\n", __func__);
>> +		return ERR_PTR(gpio_base);
> "Unknown GPIO base, falling back to dynamic allocation"
>
> Would it work like that? (Needs more work on patch, perhaps separate
> patch)
Agreed. Will be fixed in next patch version.
>
>> +	}
>> +
>>   	max7315->gpio_base = gpio_base;
>>   	if (intr != -1) {
>>   		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>> diff --git a/arch/x86/platform/intel-
>> mid/device_libs/platform_mpu3050.c b/arch/x86/platform/intel-
>> mid/device_libs/platform_mpu3050.c
>> index ee22864..2008824 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
>> @@ -19,10 +19,13 @@ static void *mpu3050_platform_data(void *info)
>>   	struct i2c_board_info *i2c_info = info;
>>   	int intr = get_gpio_by_name("mpu3050_int");
>>   
>> -	if (intr < 0)
>> -		return NULL;
>> +	if (intr < 0) {
>> +		pr_err("%s: invalid interrupt error\n", __func__);
> pr_err("%s: Can't find %s GPIO interrupt\n", __func__, MPU3050_INT);
Agreed. Will be fixed in next patch version.
>
>> +		return ERR_PTR(intr);
>> +	}
>>   
>>   	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>> +
>>   	return NULL;
>>   }
>>   
>> diff --git a/arch/x86/platform/intel-
>> mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-
>> mid/device_libs/platform_pcal9555a.c
>> index 429a941..97e92a2 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
>> @@ -41,13 +41,15 @@ static void __init *pcal9555a_platform_data(void
>> *info)
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>>   	/* Check if the SFI record valid */
>> -	if (gpio_base = -1)
>> -		return NULL;
>> +	if (gpio_base = -1) {
>> +		pr_err("%s: invalid gpio base error\n", __func__);
>> +		return ERR_PTR(gpio_base);
> Same as above for gpio_base.
Same as above
>> +	}
>>   
>>   	if (nr >= PCAL9555A_NUM) {
>>   		pr_err("%s: Too many instances, only %d supported\n",
>> __func__,
>>   		       PCAL9555A_NUM);
>> -		return NULL;
>> +		return ERR_PTR(-ENODEV);
> -ENOMEM
Agreed. Will be fixed in next patch version.
>
>>   	}
>>   
>>   	pcal9555a = &pcal9555a_pdata[nr++];
>> diff --git a/arch/x86/platform/intel-
>> mid/device_libs/platform_tca6416.c b/arch/x86/platform/intel-
>> mid/device_libs/platform_tca6416.c
>> index 4f41372..2796956 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
>> @@ -34,8 +34,11 @@ static void *tca6416_platform_data(void *info)
>>   	gpio_base = get_gpio_by_name(base_pin_name);
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>> -	if (gpio_base < 0)
>> -		return NULL;
>> +	if (gpio_base < 0) {
>> +		pr_err("%s: invalid gpio base error\n", __func__);
>> +		return ERR_PTR(gpio_base);
> Same as above for gpio_base.
Same as above
>
>> +	}
>> +
>>   	tca6416.gpio_base = gpio_base;
>>   	if (intr >= 0) {
>>   		i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>> diff --git a/arch/x86/platform/intel-mid/sfi.c
>> b/arch/x86/platform/intel-mid/sfi.c
>> index 051d264..8e7361f 100644
>> --- a/arch/x86/platform/intel-mid/sfi.c
>> +++ b/arch/x86/platform/intel-mid/sfi.c
>> @@ -335,9 +335,12 @@ static void __init sfi_handle_ipc_dev(struct
>> sfi_device_table_entry *pentry,
>>   
>>   	pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
>>   		pentry->name, pentry->irq);
>> +
>>   	pdata = intel_mid_sfi_get_pdata(dev, pentry);
>> -	if (IS_ERR(pdata))
>> +	if (IS_ERR(pdata)) {
>> +		pr_err("ipc_device: %s: invalid platform data\n",
>> pentry->name);
>>   		return;
>> +	}
> This is actually needs more work. We have duplication in sfi.c and
> platform_ipc.c.
Yes. But platform_ipc.c implements custom ipc handler for audio ipc 
device. Even though there are duplications between custom handler and 
generic handler in sfi.c, I think its bit early to optimize this. I 
think we should revisit this once we have one more implementation of 
custom ipc handler.
>
>>   
>>   	pdev = platform_device_alloc(pentry->name, 0);
>>   	if (pdev = NULL) {
>> @@ -371,8 +374,10 @@ static void __init sfi_handle_spi_dev(struct
>> sfi_device_table_entry *pentry,
>>   		spi_info.chip_select);
>>   
>>   	pdata = intel_mid_sfi_get_pdata(dev, &spi_info);
>> -	if (IS_ERR(pdata))
>> +	if (IS_ERR(pdata)) {
>>
>> +		pr_err("spi_device: %s: invalid platform data\n",
>> pentry->name);
> Since you print messages in device_libs files I would drop this one
> because it has no value. OTOH you can move it to debug level and
> rephrase:
>
> pr_debug("%s: Can't get platform data for %s\n", __func__ [or "SPI
> ..."], pentry->name);
Agreed. Will be fixed in next version.
>
>>   		return;
>> +	}
>>   
>>   	spi_info.platform_data = pdata;
>>   	if (dev->delay)
>> @@ -398,8 +403,10 @@ static void __init sfi_handle_i2c_dev(struct
>> sfi_device_table_entry *pentry,
>>   		i2c_info.addr);
>>   	pdata = intel_mid_sfi_get_pdata(dev, &i2c_info);
>>   	i2c_info.platform_data = pdata;
>> -	if (IS_ERR(pdata))
>> +	if (IS_ERR(pdata)) {
>> +		pr_err("i2c_device: %s: invalid platform data\n",
>> pentry->name);
>>   		return;
> Ditto.
Same as above.
>
>> +	}
>>   
>>   	if (dev->delay)
>>   		intel_scu_i2c_device_register(pentry->host_num,
>> &i2c_info);
>> @@ -424,8 +431,10 @@ static void __init sfi_handle_sd_dev(struct
>> sfi_device_table_entry *pentry,
>>   		 sd_info.max_clk,
>>   		 sd_info.addr);
>>   	pdata = intel_mid_sfi_get_pdata(dev, &sd_info);
>> -	if (IS_ERR(pdata))
>> +	if (IS_ERR(pdata)) {
>> +		pr_err("sd_device: %s: invalid platform data\n",
>> pentry->name);
>>   		return;
>> +	}
> Ditto.
Same as above.
>
>>   
>>   	/* Nothing we can do with this for now */
>>   	sd_info.platform_data = pdata;

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

