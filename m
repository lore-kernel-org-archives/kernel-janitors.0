From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 09:55:59 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <3f21cd1f-44a2-0f2c-c8cd-e97e249e53a3@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

+cc Daniel Mack

On 2019/3/23 17:29, Pavel Machek wrote:
> On Sat 2019-03-23 02:45:23, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/leds/leds-lt3593.c: In function 'lt3593_led_probe':
>> drivers/leds/leds-lt3593.c:69:19: warning:
>>  variable 'flags' set but not used [-Wunused-but-set-variable]
>>
>> It's never used since inroduction in
>> commit 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Does the driver work for you? I mean... take a look at the code, those
> flags seem to be needed.
> 
> You probably want to cc original author of the commit.

ok.

> 
> 									Pavel
> 
>> ---
>>  drivers/leds/leds-lt3593.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
>> index 54f0e5dbdbd0..912b8d1bbd92 100644
>> --- a/drivers/leds/leds-lt3593.c
>> +++ b/drivers/leds/leds-lt3593.c
>> @@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
>>  	struct lt3593_led_data *led_data;
>>  	struct fwnode_handle *child;
>>  	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
>> -	enum gpiod_flags flags = GPIOD_OUT_LOW;
>>  	const char *tmp;
>>  
>>  	if (!dev->of_node)
>> @@ -101,10 +100,8 @@ static int lt3593_led_probe(struct platform_device *pdev)
>>  	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
>>  		if (!strcmp(tmp, "keep")) {
>>  			state = LEDS_GPIO_DEFSTATE_KEEP;
>> -			flags = GPIOD_ASIS;
>>  		} else if (!strcmp(tmp, "on")) {
>>  			state = LEDS_GPIO_DEFSTATE_ON;
>> -			flags = GPIOD_OUT_HIGH;
>>  		}
>>  	}
>>
>>
> 
