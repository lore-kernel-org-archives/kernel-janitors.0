From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Tue, 18 Jun 2019 09:35:34 +0000
Subject: Re: drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <714a38fe-a733-7264-bb06-d94bd58a245a@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
 <910a5806-9a08-adf4-4fba-d5ec2f5807ff@metux.net>
 <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
In-Reply-To: <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

On 18.06.19 07:37, Markus Elfring wrote:
>>> Two function calls were combined in this function implementation.
>>> Inline corresponding code so that extra error checks can be avoided here.
>>
>> What exactly is the purpose of this ?
> 
> I suggest to take another look at the need and relevance of involved
> error checks in the discussed function combination.

Sorry, don't have the time for guessing and trying to reproduce your
thoughts. That's why we have patch descriptions / commit messages.
It would be a lot easier for all of us if you just desribe the exact
problem you'd like to solve and your approach to do so.

>> Looks like a notable code duplication ...
> 
> This can be.

I doubt that code duplication is appreciated, as this increases the
maintenance overhead. (actually, we're usually trying to reduce that,
eg. by using lots of generic helpers).

>> I thought we usually try to reduce this, instead of introducing new ones.
> 
> Would you like to check the software circumstances once more
> for the generation of a similar code structure by a C compiler
> (or optimiser)?

As said: unfortunately, I don't have the time to do that - you'd have to
tell us, what exactly you've got in mind.

If it's just about some error checks which happen to be redundant in a
particular case, you'll have to show that this case is a *really* hot
path (eg. irq, syscall, scheduling, etc) - but I don't see that here.

What's the exact scenario you're trying to optimize ? Any actual
measurements on how your patch improves that ?


Look, I understand that you'd like to squeeze out maximum performance,
but this has to be practically maintainable. I could list a lot of
things that I don't need in particular use cases and would like to
introduce build knobs for, but I have to understand that maintainers
have to be pretty reluctant towards those things.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
