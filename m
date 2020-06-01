From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Date: Mon, 01 Jun 2020 17:31:27 +0000
Subject: Re: [PATCH] misc: atmel-ssc: lock with mutex instead of spinlock
Message-Id: <20200601173126.GA31822@qmqm.qmqm.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb9b1cb3-5b3f-f387-da45-71427a4383ed@web.de>
In-Reply-To: <eb9b1cb3-5b3f-f387-da45-71427a4383ed@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org

On Mon, Jun 01, 2020 at 11:18:48AM +0200, Markus Elfring wrote:
> > Uninterruptible context is not needed in the driver and causes lockdep
> > warning because of mutex taken in of_alias_get_id().
> 
> Was a spin lock taken?
> > Convert the lock to mutex to avoid the issue.
> Would you like to add the tag “Fixes” to the commit message?

I guess we can add:

Fixes: 099343c64e16 ("ARM: at91: atmel-ssc: add device tree support")

Best Regards
Michał Mirosław
