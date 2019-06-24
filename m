From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 24 Jun 2019 10:51:06 +0000
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
Message-Id: <a2c9c7f2-0efb-e56c-517e-f5c3fda4ee92@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
In-Reply-To: <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Enrico Weigelt <lkml@metux.net>

>> +++ b/drivers/base/platform.c
>> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform=
_device *dev,
>>         return NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(platform_get_resource);
>> +#ifdef CONFIG_HAS_IOMEM
>>
>>  /**
>>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for a =
platform
>> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>>   *        resource management
>>   * @index: resource index
>>   */
>> -#ifdef CONFIG_HAS_IOMEM
>>  void __iomem *devm_platform_ioremap_resource(struct platform_device *pd=
ev,
>>                                              unsigned int index)
>>  {
=E2=80=A6
> And what is the purpose of that?

I recommend to let the availability of additional documentation for this fu=
nction
depend also on the mentioned preprocessor symbol

Regards,
Markus
