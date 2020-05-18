From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 18 May 2020 19:23:31 +0000
Subject: Re: [PATCH 1/2] drivers: provide devm_platform_request_irq()
Message-Id: <e679788a-d616-a45d-f12d-20485aad2f43@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Barry Song <baohua@kernel.org>, Baruch Siach <baruch@tkos.co.il>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Paul Cercueil <paul@crapouillou.net>, Radu Pirea <radu_nicolae.pirea@upb.ro>, "Rafael J. Wysocki" <rafael@kernel.org>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Zhou Yanjie <zhouyanjie@wanyeetech.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com

> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right of the error handling
> for these two functions in some drivers. so provide this function
> to simplify the driver.

I suggest to improve also this change description.
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
