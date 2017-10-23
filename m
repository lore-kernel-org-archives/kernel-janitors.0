From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 05:53:07 +0000
Subject: Re: devfreq/exynos-bus: Use common error handling code in exynos_bus_target()
Message-Id: <e84ea128-d69e-7c77-db3a-44622457f347@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20171022134057epcas4p43e6f37b8994c28f6ef240536349811a8@epcas4p4.samsung.com>
 <4a407cd6-020c-1750-019a-6c0ceb40e245@users.sourceforge.net>
 <59ED4313.701@samsung.com>
In-Reply-To: <59ED4313.701@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

> As I already commented on your other patch related to extcon-max14577,
> this patch might remove the redundant error message.

I hope that more software improvements can be achieved in this design direction.


> But, it makes the code more complicated in side of readability. I prefer existing code.

I prefer to avoid duplicated code a bit more.

Regards,
Markus
