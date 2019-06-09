From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 09 Jun 2019 08:55:32 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
In-Reply-To: <alpine.DEB.2.21.1906081925090.2543@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

>>> +- e1 = devm_ioremap_resource(arg4, id);
>>> ++ e1 = devm_platform_ioremap_resource(arg1, arg3);
>>
>> Can the following specification variant matter for the shown SmPL
>> change approach?
>>
>> + e1 =
>> +-     devm_ioremap_resource(arg4, id
>> ++     devm_platform_ioremap_resource(arg1, arg3
>> +                           );
>
> In the latter case, the original formatting of e1 will be preserved.

I would like to point the possibility out to express only required changes
also by SmPL specifications.


> But there is not usually any interesting formatting on the left side of an
> assignment (ie typically no newlines or comments).

Is there any need to trigger additional source code reformatting?


> I can see no purpose to factorizing the right parenthesis.

These characters at the end of such a function call should be kept unchanged.


I got another software development concern according to the discussed
software update “drivers: provide devm_platform_ioremap_resource()”
(from 2019-02-21).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/platform.c?id=7945f929f1a77a1c8887a97ca07f87626858ff42

The flag “IORESOURCE_MEM” is passed as the second parameter for the call
of the function “platform_get_resource” in this refactoring.
Should this detail be specified also in the proposed script for the
semantic patch language instead of using the metavariable “arg2”
in SmPL disjunctions?

How do you think about to delete error detection and corresponding
exception handling code for the previous function call?


Is the SmPL code specification “when != id” really sufficient for
the exclusion of variable reassignments here?

Regards,
Markus
