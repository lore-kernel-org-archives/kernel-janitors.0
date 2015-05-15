From: Qiao Zhou <zhouqiao@marvell.com>
Date: Fri, 15 May 2015 01:06:55 +0000
Subject: Re: mfd: Support 88pm80x in 80x driver
Message-Id: <555546AF.5000403@marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150514103124.GA21248@mwanda>
In-Reply-To: <20150514103124.GA21248@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/14/2015 08:50 PM, Lee Jones wrote:
> On Thu, 14 May 2015, Qiao Zhou wrote:
>
>> On 05/14/2015 06:31 PM, Dan Carpenter wrote:
>>> Hello Qiao Zhou,
>>>
>>> The patch 70c6cce04066: "mfd: Support 88pm80x in 80x driver" from Jul
>>> 9, 2012, leads to the following static checker warning:
>>>
>>> 	include/linux/mfd/88pm80x.h:352 pm80x_dev_suspend()
>>> 	warn: test_bit() takes a bit number
>>>
>>> include/linux/mfd/88pm80x.h
>>>     344  #ifdef CONFIG_PM
>>>     345  static inline int pm80x_dev_suspend(struct device *dev)
>>>     346  {
>>>     347          struct platform_device *pdev = to_platform_device(dev);
>>>     348          struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
>>>     349          int irq = platform_get_irq(pdev, 0);
>>>     350
>>>     351          if (device_may_wakeup(dev))
>>>     352                  set_bit((1 << irq), &chip->wu_flag);
>>>                                  ^^^^^^^^^
>>> Smatch is complaining because it's doing a double left shift.  If irq is
>>> larger than 5 then we are corrupting memory.  Also we don't use
>> Will fix this issue.
>>> ->wu_flag as a bitfield, we use it as a boolean so the name is
>>> confusing.
>>>
>>>     353
>>>     354          return 0;
>>>     355  }
>>>     356
>>>     357  static inline int pm80x_dev_resume(struct device *dev)
>>>     358  {
>>>     359          struct platform_device *pdev = to_platform_device(dev);
>>>     360          struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
>>>     361          int irq = platform_get_irq(pdev, 0);
>>>     362
>>>     363          if (device_may_wakeup(dev))
>>>     364                  clear_bit((1 << irq), &chip->wu_flag);
>>>                                    ^^^^^^^^^^
>>> Same issue.
>>>
>>>     365
>>>     366          return 0;
>>>     367  }
>>>     368  #endif
>>>
>>> drivers/mfd/88pm80x.c
>>>     133  #ifdef CONFIG_PM_SLEEP
>>>     134  static int pm80x_suspend(struct device *dev)
>>>     135  {
>>>     136          struct i2c_client *client = container_of(dev, struct i2c_client, dev);
>>>     137          struct pm80x_chip *chip = i2c_get_clientdata(client);
>>>     138
>>>     139          if (chip && chip->wu_flag)
>>>                              ^^^^^^^^^^^^^
>>> Here it is used as a bool.
>> It's designed in this way that sub device driver may use this flag.
>> Also the bit value can tell which sub device sets the flag. However
>> here we just check whether any bit is set.
>>>
>>>     140                  if (device_may_wakeup(chip->dev))
>>>     141                          enable_irq_wake(chip->irq);
>>>     142
>>>     143          return 0;
>>>     144  }
>>>     145
>>>     146  static int pm80x_resume(struct device *dev)
>>>     147  {
>>>     148          struct i2c_client *client = container_of(dev, struct i2c_client, dev);
>>>     149          struct pm80x_chip *chip = i2c_get_clientdata(client);
>>>     150
>>>     151          if (chip && chip->wu_flag)
>>>                              ^^^^^^^^^^^^^
>>> This is the only other user.
>>>
>>>     152                  if (device_may_wakeup(chip->dev))
>>>     153                          disable_irq_wake(chip->irq);
>>>     154
>>>     155          return 0;
>>>     156  }
>>>     157  #endif
>>>
>>>
>>> regards,
>>> dan carpenter
>>>
>> Dan,
>>
>> Below is the patch to fix this issue. Please have a check and I'll
>> submit an official patch to community after you reviewed. Thanks for
>> finding this issue.
>>
>>  From 96486fda25414e3b926c275b951ac1408fae7830 Mon Sep 17 00:00:00 2001
>> From: Qiao Zhou <zhouqiao@marvell.com>
>> Date: Thu, 14 May 2015 19:00:39 +0800
>> Subject: [PATCH] mfd: 88pm80x: refine irq bit operation
>>
>> Set_bit/clear_bit for wu_flag may be corrupted if irq > 5(or 6 for
>> aarch64). The maximum irq number from 88pm80x chip series is 24.
>> Here we refine the code to protect the potential memory corruption.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Qiao Zhou <zhouqiao@marvell.com>
>> ---
>>   include/linux/mfd/88pm80x.h |   16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
>> index 97cb283..a8c0318 100644
>> --- a/include/linux/mfd/88pm80x.h
>> +++ b/include/linux/mfd/88pm80x.h
>> @@ -348,8 +348,14 @@ static inline int pm80x_dev_suspend(struct device *dev)
>>   	struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
>>   	int irq = platform_get_irq(pdev, 0);
>>
>> +	if ((irq < 0) || (irq >= 24)) {
>
>                             irq > 23
>
> Or, even better:
>
> #include PM80X_MAX_IRQS		23
>
> 	if (irq < 0 || irq > PM80X_MAX_IRQS) {
>
> Drop the parentheses.
Will refine it.
>
>> +		dev_err(dev, "pm80x: wrong irq 0x%x\n", irq);
>
> No need to put pm80x, dev_err() will do that for you.
>
> s/wrong irq/Invalid IRQ/
>
> Is it really better in hex?
>
>> +		/* return 0, and do not block suspend */
>
> This comment is not required.
Will refine it.
>
>> +		return 0;
>> +	}
>> +
>>   	if (device_may_wakeup(dev))
>> -		set_bit((1 << irq), &chip->wu_flag);
>> +		set_bit(irq, &chip->wu_flag);
>
> Can you come up with a better name?
It's short for wakeup flag. I may change it to wakeup_flag. Do you have 
any suggestion if it's not okay?
>
>>   	return 0;
>>   }
>> @@ -360,8 +366,14 @@ static inline int pm80x_dev_resume(struct device *dev)
>>   	struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
>>   	int irq = platform_get_irq(pdev, 0);
>>
>> +	if ((irq < 0) || (irq >= 24)) {
>> +		dev_err(dev, "pm80x: wrong irq 0x%x\n", irq);
>> +
>
> Superfluous '\n'.
Will refine it.
>
>> +		return 0;
>> +	}
>> +
>>   	if (device_may_wakeup(dev))
>> -		clear_bit((1 << irq), &chip->wu_flag);
>> +		clear_bit(irq, &chip->wu_flag);
>>
>>   	return 0;
>>   }
>
Jones,

Thanks a lot for your review & suggestions.

-- 
Best Regards
Qiao Zhou
