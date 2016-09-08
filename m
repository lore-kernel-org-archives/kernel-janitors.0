From: sathyanarayanan kuppuswamy  <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Thu, 08 Sep 2016 22:41:37 +0000
Subject: Re: [PATCH v2 1/1] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <32bf3578-ec96-b043-67a1-7c6defb8c88c@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
 <1473293103-78682-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
 <1473339095.11323.112.camel@linux.intel.com>
In-Reply-To: <1473339095.11323.112.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com

Thanks for the review Andy. Please check my comments inline.


On 09/08/2016 05:51 AM, Andy Shevchenko wrote:
> On Wed, 2016-09-07 at 17:05 -0700, Kuppuswamy Sathyanarayanan wrote:
>> According to the intel_mid_sfi_get_pdata() function definition,
> "function" is implied, remove the word.
Will be fixed in next version.
>
>> get_platform_data() function
> Ditto.
Same as above.
>
>> should returns NULL on no platform
> returns -> return
Same as above.
>
>> data scenario and return ERR_PTR on platform data initialization
>> failures. But current device platform initialization code does not
>> follow this requirement. This patch fixes the return values issues
>> in various sfi device libs code.
> sfi -> SFI
Same as above.
>
>
> Looking into patch I would consider to split it to series:
>
> 1. Rewrite GPIO expander logic to cover dynamic allocation. You have to
> check how it supposed to be in GPIO framework. IIRC gpio_base = -1
I checked the expander driver logic. As long as we return platform data 
as NULL, it by default falls back to dynamic allocation. So I think 
returning NULL on gpio_base = -1 is itself enough to support the 
dynamic allocation.

file: a/drivers/gpio/gpio-pca953x.c

755         pdata = dev_get_platdata(&client->dev);
756         if (pdata) {
757                 irq_base = pdata->irq_base;
758                 chip->gpio_start = pdata->gpio_base;
759                 invert = pdata->invert;
760                 chip->names = pdata->names;
761         } else {
762                 chip->gpio_start = -1;
763                 irq_base = 0;
764         }

> (perhaps a defined constant) will do the trick.
> 2. Fix the actual return codes (maybe with changes to sfi.c).
> 3. Fix and add error messages.
I can split the patch into two. One for return code fix and another for 
adding error messages.
> 4+ (in the future) Address code duplication
Agreed.
>
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_max7315.c
>> @@ -29,9 +29,9 @@ static void __init *max7315_platform_data(void
>> *info)
>>   	char intr_pin_name[SFI_NAME_LEN + 1];
>>   
>>   	if (nr = MAX7315_NUM) {
>> -		pr_err("too many max7315s, we only support %d\n",
>> -				MAX7315_NUM);
>> -		return NULL;
>> +		pr_err("%s: too many max7315s, we only support %d\n",
>> +		       __func__, MAX7315_NUM);
> Use the same as for PCAL9555A:
>
> pr_err("%s: Too many instances, only %d supported\n",
Will be fixed in next version.
>
>> @@ -48,8 +48,12 @@ static void __init *max7315_platform_data(void
>> *info)
>>   	gpio_base = get_gpio_by_name(base_pin_name);
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>> -	if (gpio_base < 0)
>> +	if (gpio_base < 0) {
>> +		pr_err("%s: Unknown GPIO base number, falling back
>> to"
>> +		       "dynamic allocation\n", __func__);
> Don't split literals.
>
> pr_err("...long literal...\n",
>         args...);
>
> No. This not just the message you show and abort initialization, in case
> of dynamic allocation you have to proceed initialization.
How about we go with following warning message. Since using dynamic gpio 
allocation is not an error, I think a warning message is more than 
enough here. Also , I don't see any value in adding "Unknown gpio base 
number" to the error message. So we can remove it to fit the log message 
into one line.

+       if (gpio_base = -1) {
+               pr_warn("%s: falling back to dynamic gpio allocation\n",
+                       __func__);

>
>> index ee22864..4b33aab 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
>> @@ -14,15 +14,21 @@
>>   
>>   	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
>> +
>>   	return NULL;
> This change doesn't belong to the series.
Submitting a separate patch to fix this this single style issue seems to 
be over kill. Will it be ok if I add this to my debug message patch ?
>
>>   }
>>   
>> diff --git a/arch/x86/platform/intel-
>> mid/device_libs/platform_pcal9555a.c b/arch/x86/platform/intel-
>> mid/device_libs/platform_pcal9555a.c
>> index 429a941..190b2d2 100644
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_pcal9555a.c
>> @@ -41,13 +41,16 @@ static void __init *pcal9555a_platform_data(void
>> *info)
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>>   	/* Check if the SFI record valid */
>> -	if (gpio_base = -1)
>> +	if (gpio_base = -1) {
>> +		pr_err("%s: Unknown GPIO base number, falling back to
>> dynamic"
>> +		       "allocation\n", __func__);
>>   		return NULL;
> Same comment as above for gpio_base.
Will be fixed in next version.
>
>> --- a/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
>> +++ b/arch/x86/platform/intel-mid/device_libs/platform_tca6416.c
>> @@ -34,8 +34,12 @@ static void *tca6416_platform_data(void *info)
>>   	gpio_base = get_gpio_by_name(base_pin_name);
>>   	intr = get_gpio_by_name(intr_pin_name);
>>   
>> -	if (gpio_base < 0)
>> +	if (gpio_base < 0) {
>> +		pr_err("%s: Unknown GPIO base number, falling back to
>> dynamic"
>> +		       "allocation\n", __func__);
> Ditto.
>
>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

