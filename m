From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 20 Oct 2019 05:45:50 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <36f29ea7-7d08-fde4-daa9-e75675191e50@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de> <868spgzcti.wl-maz@kernel.org>
In-Reply-To: <868spgzcti.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Marc Zyngier <maz@kernel.org>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>>> I think part of the issue is that the script reports a WARNING

Would anybody like to change this category to “INFO”?


>> How much does this information influence really the stress tolerance
>> and change resistance (or acceptance) for the presented collateral evolution?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
>
> -ENOPARSE.

* Automated processes can trigger also big amounts of possible adjustments.

* The software development capacity will vary for affected components
  during the years.

* Implementing changes is a recurring project management task, isn't it?


>>> for something that is definitely correct code,
>>
>> Can related software improvement possibilities be taken into account
>> again under other circumstances?
>
> These patches provide no improvement whatsoever.

* Do you find information from the description of a corresponding
  commit 7945f929f1a77a1c8887a97ca07f87626858ff42
  ("drivers: provide devm_platform_ioremap_resource()") reasonable?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/base/platform.c

* How do you think about to compare any differences with
  software build results?


> As pointed out, they mostly introduce bugs.

Would you like to check any error statistics in more detail?


> Providing Coccinelle scripts that scream about perfectly valid code is pointless,

They usually point opportunities out for further collateral evolution,
don't they?


> and the result is actively harmful.

You might not like some changes for a while.


> If said script was providing a correct semantic patch

I got the impression that this can also happen often enough.
Would you like to check the concrete transformation failure rate once more?


> instead of being an incentive for people to churn untested patches
> that span the whole tree, that'd be a different story.

Various developers got motivated to achieve something (possible improvements?)
also by the means of available software analysis tools.
Mistakes can then happen as usual during such adjustment attempts.


> But that's not what this is about.

I guess that your software development concerns can be clarified a bit more.

Regards,
Markus
