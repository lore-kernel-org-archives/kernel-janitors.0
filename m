From: Bryan Wu <bryan.wu@canonical.com>
Date: Wed, 12 Sep 2012 05:46:02 +0000
Subject: Re: [leds:for-next 18/18] drivers/leds/leds-lm3530.c:432 lm3530_probe() info: why not propagate 'err
Message-Id: <CAK5ve-JSgkWqwGzWxV9ghg=h6AG3xUu8uW-EvuONLfMXzX-c-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912042018.GA22810@localhost>
In-Reply-To: <20120912042018.GA22810@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 1:18 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 12 September 2012 10:25, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> On Wed, Sep 12, 2012 at 10:17:55AM +0530, Sachin Kamat wrote:
>>> Hi Fengguang,
>>>
>>> On 12 September 2012 10:02, Fengguang Wu <fengguang.wu@intel.com> wrote:
>>> > Hi Sachin,
>>> >
>>> > On Wed, Sep 12, 2012 at 09:59:38AM +0530, Sachin Kamat wrote:
>>> >> Hi Fengguang,
>>> >>
>>> >> Thanks for bringing this to my notice. I compile tested this patch
>>> >> using the latest (11 Sep 2012) linux-next tree.
>>> >> Unfortunately I cannot not understand the meaning of these smatch warnings.
>>> >> Could you please simplify them for me?
>>> >
>>> > I think the warnings can be quieted by
>>> >
>>> > -                         return -ENODEV;
>>> > +                         return err;
>>> >
>>>
>>> The original code was something like this:
>>>
>>>                 err = -ENODEV;
>>>                 return err;
>>>
>>> which i simplified to (as a result of using devm_*)
>>>                 return -ENODEV;
>>>
>>> Hence technically i don't think I changed anything. Do you want me to
>>> revert this change back?
>>
>> I think the intention of the warning is that the err value from
>> lm3530_init_registers() can be directly returned, like this:
>>
>>                   err = lm3530_init_registers(drvdata);
>>                   if (err < 0) {
>>                           dev_err(&client->dev,
>>                                   "Register Init failed: %d\n", err);
>> -                         return -ENODEV;
>> +                         return err;
>>                   }
>>
>> That will remove the assumption that lm3530_init_registers() always
>> returns -ENODEV on error.
>
> Oh OK. Now I got it :)
> Thanks for the clarification.
> Since this was a prevalent issue with this driver (and maybe with
> other driver too?), I will send a patch to fix this up.
>

Thanks and please post a new patch, I can replace the old one to it in
my for-next branch.

>>
>> Thanks,
>> Fengguang

And thanks Fengguang.

-Bryan

>>
>>> >> On 12 September 2012 09:50, Fengguang Wu <fengguang.wu@intel.com> wrote:
>>> >> > Hi Sachin,
>>> >> >
>>> >> > FYI, there are new smatch warnings show up in
>>> >> >
>>> >> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git for-next
>>> >> > head:   2829515a5fb5ceccb4021d819c3d7d0ecaab86eb
>>> >> > commit: 2829515a5fb5ceccb4021d819c3d7d0ecaab86eb [18/18] leds-lm3530: Use devm_regulator_get function
>>> >> >
>>> >> > All smatch warnings:
>>> >> >
>>> >> >   drivers/leds/leds-lm3530.c:361 lm3530_mode_set() info: why not propagate 'mode' from lm3530_get_mode_from_str() instead of -22?
>>> >> > + drivers/leds/leds-lm3530.c:432 lm3530_probe() info: why not propagate 'err' from lm3530_init_registers() instead of -19?
>>> >> > + drivers/leds/leds-lm3530.c:438 lm3530_probe() info: why not propagate 'err' from led_classdev_register() instead of -19?
>>> >> >
>>> >> > vim +432 drivers/leds/leds-lm3530.c
>>> >> >    422                  err = PTR_ERR(drvdata->regulator);
>>> >> >    423                  drvdata->regulator = NULL;
>>> >> >    424                  return err;
>>> >> >    425          }
>>> >> >    426
>>> >> >    427          if (drvdata->pdata->brt_val) {
>>> >> >    428                  err = lm3530_init_registers(drvdata);
>>> >> >    429                  if (err < 0) {
>>> >> >    430                          dev_err(&client->dev,
>>> >> >    431                                  "Register Init failed: %d\n", err);
>>> >> >  > 432                          return -ENODEV;
>>> >> >    433                  }
>>> >> >    434          }
>>> >> >    435          err = led_classdev_register(&client->dev, &drvdata->led_dev);
>>> >> >    436          if (err < 0) {
>>> >> >    437                  dev_err(&client->dev, "Register led class failed: %d\n", err);
>>> >> >    438                  return -ENODEV;
>>> >> >    439          }
>>> >> >    440
>>> >> >    441          err = device_create_file(drvdata->led_dev.dev, &dev_attr_mode);
>>> >> >    442          if (err < 0) {
>>> >> >
>>> >> > ---
>>> >> > 0-DAY kernel build testing backend         Open Source Technology Centre
>>> >> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
>>> >>
>>> >>
>>> >>
>>> >> --
>>> >> With warm regards,
>>> >> Sachin
>>>
>>>
>>>
>>> --
>>> With warm regards,
>>> Sachin
>
>
>
> --
> With warm regards,
> Sachin



-- 
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer    +86.186-168-78255 Mobile
Canonical Ltd.      www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
