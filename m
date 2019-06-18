From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 18 Jun 2019 11:44:11 +0000
Subject: Re: drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <8ae16eae-7bb9-3a82-000f-52e16aa1eee0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
 <910a5806-9a08-adf4-4fba-d5ec2f5807ff@metux.net>
 <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
 <714a38fe-a733-7264-bb06-d94bd58a245a@metux.net>
In-Reply-To: <714a38fe-a733-7264-bb06-d94bd58a245a@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Enrico Weigelt <lkml@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

>> Would you like to check the software circumstances once more
>> for the generation of a similar code structure by a C compiler
>> (or optimiser)?
>
> As said: unfortunately, I don't have the time to do that

I became curious if you would like to adjust your software development
attention a bit more also in this area.


> - you'd have to tell us, what exactly you've got in mind.

I try to point possibilities out to improve the combination of
two functions.


> If it's just about some error checks which happen to be redundant in a
> particular case, you'll have to show that this case is a *really* hot
> path (eg. irq, syscall, scheduling, etc) - but I don't see that here.

1. May the check “resource_type(res) == IORESOURCE_MEM” be performed
   in a local loop?

2. How hot do you find the null pointer check for the device
   input parameter of the function “devm_ioremap_resource”?


> Any actual measurements on how your patch improves that ?

Not yet. - Which benchmarks would you trust here?


> Look, I understand that you'd like to squeeze out maximum performance,

I hope so.


> but this has to be practically maintainable.

This can be achieved if more contributors would find proposed
adjustments helpful for another software transformation.

Regards,
Markus
