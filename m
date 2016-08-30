From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
Date: Tue, 30 Aug 2016 18:18:17 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <a42b4af5-e2a5-d922-b5a5-ab177bb15140@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 08/30/2016 04:13 AM, Andy Shevchenko wrote:
> On Tue, 2016-08-30 at 13:06 +0200, walter harms wrote:
>> Am 30.08.2016 11:46, schrieb Andy Shevchenko:
>>> On Mon, 2016-08-29 at 20:59 +0000, Kuppuswamy, Sathyanarayanan
>>> wrote:
>>>> Hi Andy/Dan,
>>>>
>>>> Thanks for catching this bug. As Andy mentioned, this code is
>>>> written
>>>> in this manner to let the get_platform_data() function pointer to
>>>> return the error value on initialization failure. But it has never
>>>> been used properly in any of the existing code. So my suggestion
>>>> is
>>>> either change the platform_lib code to return ERR_PTR on failure
>>>> or
>>>> change the intel_mid_sfi_get_pdata to check for NULL as well.
>>>> Since
>>>> all the use case of intel_mid_sfi_get_pdata are void functions, I
>>>> would prefer to go with second solution. Please let me know your
>>>> comments.
>>>>
>>>> diff --git a/arch/x86/platform/intel-mid/sfi.c
>>>> b/arch/x86/platform/intel-mid/sfi.c
>>>> index 051d264..a6bd275 100644
>>>> --- a/arch/x86/platform/intel-mid/sfi.c
>>>> +++ b/arch/x86/platform/intel-mid/sfi.c
>>>> @@ -336,7 +336,7 @@ static void __init sfi_handle_ipc_dev(struct
>>>> sfi_device_table_entry *pentry,
>>>>          pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
>>>>                  pentry->name, pentry->irq);
>>>>          pdata = intel_mid_sfi_get_pdata(dev, pentry);
>>>> -       if (IS_ERR(pdata))
>>>> +       if (IS_ERR_OR_NULL(pdata))
>>> But this looks wrong.
>>> pdata = NULL is valid case for many devices! In other words pdata
>>> is an
>>> optional argument to the device drivers.
>>>
>> Yep, the way is wrong.
>> NULL can say: get_platform_data does not exists
>> or get_platform_data() returned NULL (what ever that means).
>>
>> IMHO it feels better to drop the define and replace it
>> with a proper function call and error.
> Yeah, this direction looks better, thanks.
I missed the generic null scenario. Thanks for pointing it out Andy.

IMO, Main problem here is, In some scenarios get_platform_data returns 
NULL on error case and in some cases it return NULL for no platform data 
case.

For example, in following function, returning NULL on gpio_base = -1 
and when nr >= PCAL9555A_NUM is incorrect. I think in both these 
scenarios valid behavior is to stop the device creation process. 
Creating an i2c device without validi irq number or gpio number is 
incorrect.

So after investigating it bit more, I think its more appropriate to fix 
these error cases in device_libs dir. Let me know your comments.

static void __init *pcal9555a_platform_data(void *info)
{
         struct i2c_board_info *i2c_info = info;
         char *type = i2c_info->type;
         struct pca953x_platform_data *pcal9555a;
         char base_pin_name[SFI_NAME_LEN + 1];
         char intr_pin_name[SFI_NAME_LEN + 1];
         int gpio_base, intr;

         snprintf(base_pin_name, sizeof(base_pin_name), "%s_base", type);
         snprintf(intr_pin_name, sizeof(intr_pin_name), "%s_int", type);

         gpio_base = get_gpio_by_name(base_pin_name);
         intr = get_gpio_by_name(intr_pin_name);

         /* Check if the SFI record valid */
         if (gpio_base = -1)
                 return NULL;

         if (nr >= PCAL9555A_NUM) {
                 pr_err("%s: Too many instances, only %d supported\n", 
__func__,
                        PCAL9555A_NUM);
                 return NULL;
         }

         pcal9555a = &pcal9555a_pdata[nr++];
         pcal9555a->gpio_base = gpio_base;

         if (intr >= 0) {
                 i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
                 pcal9555a->irq_base = gpio_base + INTEL_MID_IRQ_OFFSET;
         } else {
                 i2c_info->irq = -1;
                 pcal9555a->irq_base = -1;
         }

         strcpy(type, "pcal9555a");
         return pcal9555a;
}

>
>> #define intel_mid_sfi_get_pdata(dev, priv)      \
>>           ((dev)->get_platform_data ? (dev)->get_platform_data(priv) :
>> NULL)
>>
>>
>> void *fkt(struct devs_id *dev, void *info)
>> {
>>       if ( ! dev->get_platform_data)
>> 	  return ERR_PTR(-ENOSYS);
>>
>> 	return dev->get_platform_data(info);
>> }
>>
>>>> I've checked all upstreamed platform modules
>>>> (arch/x86/platform/intel-
>>>> mid/device_libs/) and noticed that not a single one returns
>>>> ERR_PTR.
>>>>
>>>> Though I think the idea was to provide a way to fail
>>>> initialization in
>>>> some cases where hardware must be initialized properly. Maybe
>>>> David or
>>>> Sathya can shed a light on this.
>>>>
>>>> If we decide to change that it should be done for all so called
>>>> device
>>>> handlers in sfi.c.
>>>>
>>>> --
>>>> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Intel Finland Oy

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

