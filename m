From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 18 Jun 2019 05:37:31 +0000
Subject: Re: drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
 <910a5806-9a08-adf4-4fba-d5ec2f5807ff@metux.net>
In-Reply-To: <910a5806-9a08-adf4-4fba-d5ec2f5807ff@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <lkml@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

>> Two function calls were combined in this function implementation.
>> Inline corresponding code so that extra error checks can be avoided here.
>
> What exactly is the purpose of this ?

I suggest to take another look at the need and relevance of involved
error checks in the discussed function combination.


> Looks like a notable code duplication ...

This can be.


> I thought we usually try to reduce this, instead of introducing new ones.

Would you like to check the software circumstances once more
for the generation of a similar code structure by a C compiler
(or optimiser)?

Regards,
Markus
