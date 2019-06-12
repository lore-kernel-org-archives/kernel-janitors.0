From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 12 Jun 2019 06:24:12 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <f6fe6400-8fdd-cb53-f7e1-ac6188c9e785@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
In-Reply-To: <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Enrico Weigelt <lkml@metux.net>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

>> The flag “IORESOURCE_MEM” is passed as the second parameter for the call
>> of the function “platform_get_resource” in this refactoring.
>
> In that particular case, we maybe should consider separate inline
> helpers instead of passing this is a parameter.
>
> Maybe it would even be more efficient to have completely separate
> versions of devm_platform_ioremap_resource(), so we don't even have
> to pass that parameter on stack.

Would you like to add another function which should be called instead of
the combination of the functions “platform_get_resource” and “devm_ioremap_resource”?

Regards,
Markus
