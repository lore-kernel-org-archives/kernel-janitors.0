From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jun 2019 10:07:09 +0000
Subject: Re: [PATCH] drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <20190614100709.GB8466@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
In-Reply-To: <032e347f-e575-c89c-fa62-473d52232735@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

On Fri, Jun 14, 2019 at 11:22:40AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Jun 2019 11:05:33 +0200
> 
> Two function calls were combined in this function implementation.
> Inline corresponding code so that extra error checks can be avoided here.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/base/platform.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)

Hey, looks like you timed out from my kill-file and this snuck through
somehow.  Let me go add you again to it, so I'm not bothered by
pointless stuff like this anymore.

*plonk*
