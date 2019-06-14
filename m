From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 14 Jun 2019 16:14:33 +0000
Subject: Re: drivers: Provide devm_platform_ioremap_resource_byname()
Message-Id: <48877575-90b9-3db5-7a25-53cf3817b2ee@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de>
 <20190614133840.GN9224@smile.fi.intel.com> <20190614141004.GC7234@kroah.com>
 <20190614144706.GO9224@smile.fi.intel.com>
In-Reply-To: <20190614144706.GO9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Ping CHNG <jack.ping.chng@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Enrico Weigelt <lkml@metux.net>, Linus Walleij <linus.walleij@linaro.org>

>> I don't like adding new apis with no user.
>
> Perhaps Jack Ping will send it as a first patch of his series where he utilizes
> this functionality. Would it be acceptable?

The proposed function can get wider application in a reasonable time frame
if a corresponding script for the semantic patch language (Coccinelle software)
would perform an automatic source code conversion (for example)
according to your change acceptance.
How do you think about to support a bit more collateral software evolution?

Regards,
Markus
