From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 19 Apr 2020 16:19:12 +0000
Subject: Re: [PATCH net-next v1] can: ti_hecc: convert to devm_platform_ioremap_resource_byname()
Message-Id: <08979629-d9b8-6656-222f-4e84667651a1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Marc Kleine-Budde <mkl@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

> use devm_platform_ioremap_resource_byname() to simplify code,
> it contains platform_get_resource_byname() and
> devm_ioremap_resource(), and also remove some duplicate error
> message.

How do you think about a wording variant like the following?

   Use the function “devm_platform_ioremap_resource_byname” to simplify
   source code which calls the functions “platform_get_resource_byname”
   and “devm_ioremap_resource”.
   Remove also a few error messages which became unnecessary with this
   software refactoring.


Will any more contributors get into the development mood to achieve
similar collateral evolution by the means of the semantic patch language?
Would you like to increase applications of the Coccinelle software?

Regards,
Markus
