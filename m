From: Daniel Mack <daniel@zonque.org>
Date: Sat, 23 Mar 2019 10:10:56 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <8576426b-25f1-d9b5-6489-9cc723ea41f3@zonque.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 23/3/2019 10:59 AM, Pavel Machek wrote:
> On Sat 2019-03-23 17:55:59, YueHaibing wrote:
>> +cc Daniel Mack
>>
>> On 2019/3/23 17:29, Pavel Machek wrote:
>>> On Sat 2019-03-23 02:45:23, YueHaibing wrote:
>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>
>>>> drivers/leds/leds-lt3593.c: In function 'lt3593_led_probe':
>>>> drivers/leds/leds-lt3593.c:69:19: warning:
>>>>  variable 'flags' set but not used [-Wunused-but-set-variable]
>>>>
>>>> It's never used since inroduction in
>>>> commit 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")
>>>>
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>
>>> Does the driver work for you? I mean... take a look at the code, those
>>> flags seem to be needed.
>>>
>>> You probably want to cc original author of the commit.
>>
>> ok.
> 
> Does the driver work for you? I mean... take a look at the code, those
> flags seem to be needed.

No. It's in fact an oversight introduced in 8cd7d6daba93 ("leds: lt3593:
Add device tree probing glue"). I likely copied the code to parse the
"default-state" property from the gpio-led driver, but all it would have
needed is the assignment of "state", not "flags". The latter can be
removed. Thanks for noting, YueHaibing.

I can't seem to find the patch anywhere in the archives though.


Daniel
