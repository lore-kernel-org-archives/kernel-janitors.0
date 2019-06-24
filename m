From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 24 Jun 2019 10:05:42 +0000
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
Message-Id: <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
In-Reply-To: <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 24.06.19 10:29, Bartosz Golaszewski wrote:
> pt., 14 cze 2019 o 18:50 Markus Elfring <Markus.Elfring@web.de> napisał(a):
>>
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Fri, 14 Jun 2019 17:45:13 +0200
>>
>> Move the preprocessor statement “#ifdef CONFIG_HAS_IOMEM” so that
>> the corresponding scope for conditional compilation includes also comments
>> for this function implementation.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/base/platform.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>> index 4d1729853d1a..a5f40974a6ef 100644
>> --- a/drivers/base/platform.c
>> +++ b/drivers/base/platform.c
>> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform_device *dev,
>>         return NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(platform_get_resource);
>> +#ifdef CONFIG_HAS_IOMEM
>>
>>  /**
>>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
>> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>>   *        resource management
>>   * @index: resource index
>>   */
>> -#ifdef CONFIG_HAS_IOMEM
>>  void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
>>                                              unsigned int index)
>>  {
>> --
>> 2.22.0
>>
> 
> And what is the purpose of that?

I can imagine that this could improve readability a little bit. Maybe if
one uses same fancy ide/editor that can fold code blocks like functions
and conditionals, this patch could make the code prettier.

The patch seems pretty trivial and doesn't change any actual code, so
I don't see hard resons for rejecting it.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
