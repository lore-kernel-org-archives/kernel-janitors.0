From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 15 Jun 2019 08:44:30 +0000
Subject: Re: drivers: Provide devm_platform_ioremap_resource_byname()
Message-Id: <alpine.DEB.2.21.1906151044160.2614@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de> <20190614133840.GN9224@smile.fi.intel.com> <20190614141004.GC7234@kroah.com> <20190614144706.GO9224@smile.fi.intel.com> <48877575-90b9-3db5-7a25-53cf3817b2ee@web.de>
In-Reply-To: <48877575-90b9-3db5-7a25-53cf3817b2ee@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Ping CHNG <jack.ping.chng@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Enrico Weigelt <lkml@metux.net>, Linus Walleij <linus.walleij@linaro.org>



On Fri, 14 Jun 2019, Markus Elfring wrote:

> >> I don't like adding new apis with no user.
> >
> > Perhaps Jack Ping will send it as a first patch of his series where he utilizes
> > this functionality. Would it be acceptable?
>
> The proposed function can get wider application in a reasonable time frame
> if a corresponding script for the semantic patch language (Coccinelle software)
> would perform an automatic source code conversion (for example)
> according to your change acceptance.
> How do you think about to support a bit more collateral software evolution?

Why don't you just do what is asked for?

julia
