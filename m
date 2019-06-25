From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 25 Jun 2019 07:42:39 +0000
Subject: Re: drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
Message-Id: <cc61e17a-1a0f-1839-8200-a36ddfdc2a39@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
 <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
 <20190625073016.GA18381@kroah.com>
In-Reply-To: <20190625073016.GA18381@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Enrico Weigelt <lkml@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Why are you all arguing with a all-but-instinguishable-from-a-bot persona

I am curious if another meeting at a Linux conference
can adjust this view.


> about a patch that I will never apply?

I hope that you can get into a more constructive mood a bit later
for the reconsideration of the position for the preprocessor
statement “#ifdef CONFIG_HAS_IOMEM” before a function implementation.

Regards,
Markus
