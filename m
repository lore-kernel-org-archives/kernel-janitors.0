From: Marc Zyngier <maz@kernel.org>
Date: Thu, 17 Oct 2019 16:13:47 +0000
Subject: Re: [PATCH] coccinelle: =?UTF-8?Q?api/devm=5Fplatform=5Fioremap?=  =?UTF-8?Q?=5Fresource=3A=20remove
Message-Id: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Linus Torvalds <torvalds@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, linux-kernel@vger.kernel.org

On 2019-10-17 15:22, Alexandre Belloni wrote:
> While it is useful for new drivers to use 
> devm_platform_ioremap_resource,
> this script is currently used to spam maintainers, often updating 
> very old
> drivers. The net benefit is the removal of 2 lines of code in the 
> driver
> but the review load for the maintainers is huge. As of now, more that 
> 560
> patches have been sent, some of them obviously broken, as in:
>
> 
> https://lore.kernel.org/lkml/9bbcce19c777583815c92ce3c2ff2586@www.loen.fr/
>
> Remove the script to reduce the spam.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

I think part of the issue is that the script reports a WARNING for 
something
that is definitely correct code, and could instead be simply toned 
down.

Anyway, FWIW:

Acked-by: Marc Zyngier <maz@kernel.org>

         M.
-- 
Jazz is not dead. It just smells funny...
