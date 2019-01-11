From: Marek Vasut <marek.vasut@gmail.com>
Date: Fri, 11 Jan 2019 11:31:07 +0000
Subject: Re: [PATCH -next] gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static
Message-Id: <5f6dae71-6d77-5dbc-73bc-35adf006dd58@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
In-Reply-To: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/11/19 6:45 AM, weiyongjun (A) wrote:
>>>>
>>>> On 1/10/19 3:07 PM, Wei Yongjun wrote:
>>>>> Fixes the following sparse warning:
>>>>>
>>>>> drivers/gpio/gpio-pca953x.c:292:28: warning:
>>>>>  symbol 'pca953x_i2c_regmap' was not declared. Should it be static?
>>>>>
>>>>> Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
>>>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>>>
>>>> Nice, thanks.
>>>> Reviewed-by: Marek Vasut <marex@denx.de>
>>>>
>>>> For future reference, how did you run sparse to detect this ?
>>>
>>>
>>> I have a script which run sparse everyday on each changed file
>>> of linux-next.git tree. So most of this issues can be detected.
>>
>> Can you share that script ? I'm sure others can benefit from that too.
> 
> Sure, the script exists in my github, as a part of our automated patch system.
> https://github.com/weiyj/dpatch-devel/blob/master/dpatch/core/checksparse.py
> 
> We are considering making it as a public system, but still not ready.

Fantastic, thanks!

-- 
Best regards,
Marek Vasut
