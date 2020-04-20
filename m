From: Dejin Zheng <zhengdejin5@gmail.com>
Date: Mon, 20 Apr 2020 13:13:27 +0000
Subject: Re: [PATCH net-next v1] can: ti_hecc: convert to devm_platform_ioremap_resource_byname()
Message-Id: <20200420131327.GA8103@nuc8i5>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08979629-d9b8-6656-222f-4e84667651a1@web.de>
In-Reply-To: <08979629-d9b8-6656-222f-4e84667651a1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Coccinelle <cocci@systeme.lip6.fr>, "David S. Miller" <davem@davemloft.net>, Wolfgang Grandegger <wg@grandegger.com>

On Sun, Apr 19, 2020 at 06:19:12PM +0200, Markus Elfring wrote:
> > use devm_platform_ioremap_resource_byname() to simplify code,
> > it contains platform_get_resource_byname() and
> > devm_ioremap_resource(), and also remove some duplicate error
> > message.
> 
> How do you think about a wording variant like the following?
> 
>    Use the function “devm_platform_ioremap_resource_byname” to simplify
>    source code which calls the functions “platform_get_resource_byname”
>    and “devm_ioremap_resource”.
>    Remove also a few error messages which became unnecessary with this
>    software refactoring.
>
Markus, Thank you very much！yes, your comments is better. I will send
the patch v2. Thanks again!

> 
> Will any more contributors get into the development mood to achieve
> similar collateral evolution by the means of the semantic patch language?
> Would you like to increase applications of the Coccinelle software?
>
I want, but currently I don't have much free time, sorry！

BR,
Dejin
> Regards,
> Markus
