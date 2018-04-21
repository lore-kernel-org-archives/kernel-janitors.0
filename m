From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sat, 21 Apr 2018 19:35:21 +0000
Subject: Re: [PATCH 29/61] mtd: devices: simplify getting .drvdata
Message-Id: <87o9icxshy.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
 (Wolfram Sang's message of "Thu, 19 Apr 2018 16:05:59 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
