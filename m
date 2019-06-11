From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Tue, 11 Jun 2019 20:40:25 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
In-Reply-To: <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Julia Lawall <julia.lawall@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

On 09.06.19 10:55, Markus Elfring wrote:

<snip>

>> But there is not usually any interesting formatting on the left side of an
>> assignment (ie typically no newlines or comments).
> 
> Is there any need to trigger additional source code reformatting?
> 
>> I can see no purpose to factorizing the right parenthesis.
> 
> These characters at the end of such a function call should be kept unchanged.

Agreed. OTOH, we all know that spatch results still need to be carefully
checked. I suspect trying to teach it all the formatting rules of the
kernel isn't an easy task.

> The flag “IORESOURCE_MEM” is passed as the second parameter for the call
> of the function “platform_get_resource” in this refactoring.

In that particular case, we maybe should consider separate inline
helpers instead of passing this is a parameter.

Maybe it would even be more efficient to have completely separate
versions of devm_platform_ioremap_resource(), so we don't even have
to pass that parameter on stack.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
