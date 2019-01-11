From: Marek Vasut <marek.vasut@gmail.com>
Date: Fri, 11 Jan 2019 02:33:44 +0000
Subject: Re: [PATCH -next] gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static
Message-Id: <929295cb-9562-54cb-c889-bb714916c732@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
In-Reply-To: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/11/19 2:50 AM, weiyongjun (A) wrote:
>> From: Marek Vasut [mailto:marek.vasut@gmail.com]
>> Sent: Thursday, January 10, 2019 10:07 PM
>> To: weiyongjun (A) <weiyongjun1@huawei.com>; Linus Walleij
>> <linus.walleij@linaro.org>; Bartosz Golaszewski
>> <bgolaszewski@baylibre.com>
>> Cc: linux-gpio@vger.kernel.org; kernel-janitors@vger.kernel.org
>> Subject: Re: [PATCH -next] gpio: pca953x: Make symbol
>> 'pca953x_i2c_regmap' static
>>
>> On 1/10/19 3:07 PM, Wei Yongjun wrote:
>>> Fixes the following sparse warning:
>>>
>>> drivers/gpio/gpio-pca953x.c:292:28: warning:
>>>  symbol 'pca953x_i2c_regmap' was not declared. Should it be static?
>>>
>>> Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> Nice, thanks.
>> Reviewed-by: Marek Vasut <marex@denx.de>
>>
>> For future reference, how did you run sparse to detect this ?
> 
> 
> I have a script which run sparse everyday on each changed file
> of linux-next.git tree. So most of this issues can be detected.

Can you share that script ? I'm sure others can benefit from that too.

-- 
Best regards,
Marek Vasut
