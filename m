From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 15 Jun 2019 11:00:17 +0000
Subject: Re: drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <4b4b2d76-7af5-5466-16ea-aad0825578a0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
 <alpine.DEB.2.20.1906141127030.9068@hadrien>
In-Reply-To: <alpine.DEB.2.20.1906141127030.9068@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

>> Two function calls were combined in this function implementation.
>> Inline corresponding code so that extra error checks can be avoided here.
>
> I don't see any point to this at all.

Would you like to take another look at corresponding design options?

How do you think about to check run time characteristics any more?


> By inlining the code, you have created a clone,
> which will introduce extra work to maintain in the future.

Would you find the shown software transformation acceptable
if a C compiler will be able to generate a similar code structure?

Regards,
Markus
