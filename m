From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 10:34:17 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <df8e1dc3-4ac1-4a30-ff44-881131982538@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2019/3/23 18:25, Daniel Mack wrote:
> On 23/3/2019 11:15 AM, Pavel Machek wrote:
>> On Sat 2019-03-23 11:13:25, Daniel Mack wrote:
>>> On 23/3/2019 10:55 AM, YueHaibing wrote:
>>>>>> ---
>>>>>>  drivers/leds/leds-lt3593.c | 3 ---
>>>>>>  1 file changed, 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
>>>>>> index 54f0e5dbdbd0..912b8d1bbd92 100644
>>>>>> --- a/drivers/leds/leds-lt3593.c
>>>>>> +++ b/drivers/leds/leds-lt3593.c
>>>>>> @@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
>>>>>>  	struct lt3593_led_data *led_data;
>>>>>>  	struct fwnode_handle *child;
>>>>>>  	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
>>>>>> -	enum gpiod_flags flags = GPIOD_OUT_LOW;
>>>>>>  	const char *tmp;
>>>>>>  
>>>>>>  	if (!dev->of_node)
>>>>>> @@ -101,10 +100,8 @@ static int lt3593_led_probe(struct platform_device *pdev)
>>>>>>  	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
>>>>>>  		if (!strcmp(tmp, "keep")) {
>>>>>>  			state = LEDS_GPIO_DEFSTATE_KEEP;
>>>>>> -			flags = GPIOD_ASIS;
>>>>>>  		} else if (!strcmp(tmp, "on")) {
>>>>>>  			state = LEDS_GPIO_DEFSTATE_ON;
>>>>>> -			flags = GPIOD_OUT_HIGH;
>>>>>>  		}
>>>
>>> With only a single statement left in either branch, you can now remove
>>> the curly braces as well.
>>
>> If I look at code below, there's no difference between DEFSTATE_KEEP
>> and DEFSTATE_ON, right? I can't see how it works.
> 
> Ah, you're right. Yes, the "keep" branch needs to go away entirely.
> 
> As the chip can't be queried for it's current state, the "keep" option
> doesn't make sense. The only option in DT should be turn the LED on or
> off at probe time. YueHaibing, can you add that to your patch?

Ok. I will send v2 with this.

> 
> 
> Thanks,
> Daniel
> 
> 
