From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 17 Jun 2019 13:54:40 +0000
Subject: Re: drivers: Provide devm_platform_ioremap_resource_byname()
Message-Id: <3ca31684-ac8b-441a-d736-5f30b7ee2229@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de>
 <20190614133840.GN9224@smile.fi.intel.com> <20190614141004.GC7234@kroah.com>
 <CAJZ5v0iBSq+DHqkevbLS0kYbaKGM0zYjg0KAzNhqYjCXvrQ-RQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0iBSq+DHqkevbLS0kYbaKGM0zYjg0KAzNhqYjCXvrQ-RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jack Ping CHNG <jack.ping.chng@linux.intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Enrico Weigelt <lkml@metux.net>, Himanshu Jha <himanshujha199640@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

>> I don't like adding new apis with no user.
>
> I agree with that too.

How do you think about the possibility to let an improved script
for the semantic patch language (Coccinelle software) perform
the desired software transformation so that the usage of
an additional function would get introduced by a known algorithm?

Can an agreement be achieved for the function name before?

Regards,
Markus
