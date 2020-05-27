From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 27 May 2020 18:45:09 +0000
Subject: Re: [PATCH v3 1/2] drivers: provide devm_platform_request_irq()
Message-Id: <5dad9b19-ceb5-1606-9f62-7626e5677971@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Coccinelle <cocci@systeme.lip6.fr>

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
