From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 24 May 2020 07:00:28 +0000
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_request_irq()
Message-Id: <b0a8e1be-359a-17bf-0eb8-dcf175042811@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Barry Song <baohua@kernel.org>, Baruch Siach <baruch@tkos.co.il>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Paul Cercueil <paul@crapouillou.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.

I recommend to improve also this change description.
How do you think about a wording variant like the following?

   The function “devm_request_irq” is called after the
   function “platform_get_irq” in many drivers.
   The exception handling is incomplete there sometimes.
   Thus add a corresponding wrapper function for the simplification
   of the drivers.


Will a companion script for the semantic patch language (Coccinelle software)
become helpful for further support of collateral evolution?

Regards,
Markus
