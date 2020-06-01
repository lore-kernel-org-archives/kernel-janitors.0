From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 09:18:48 +0000
Subject: Re: [PATCH] misc: atmel-ssc: lock with mutex instead of spinlock
Message-Id: <eb9b1cb3-5b3f-f387-da45-71427a4383ed@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>

> Uninterruptible context is not needed in the driver and causes lockdep
> warning because of mutex taken in of_alias_get_id().

Was a spin lock taken?


> Convert the lock to mutex to avoid the issue.

Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
