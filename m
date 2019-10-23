From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 23 Oct 2019 08:00:24 +0000
Subject: Re: [PATCH v2] clocksource/drivers: Fix memory leak in ttc_setup_clockevent
Message-Id: <3785f6cf-e8ea-9cd8-80b3-e88b2c4d085f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com>
 <20191023043139.31183-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191023043139.31183-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> In the implementation of ttc_setup_clockevent() release the allocated
> memory for ttcce if clk_notifier_register() fails.

I got other wording preferences. Thus I imagine that such a change
description can still be improved another bit.
Would you like to express the addition of a jump target (according to
the Linux coding style) for the completion of desired exception handling
in a different way?


…
> +++ b/drivers/clocksource/timer-cadence-ttc.c
…
> @@ -453,15 +451,18 @@ static int __init ttc_setup_clockevent(struct clk *clk,
…
> +release_ttcce:
> +
> +	kfree(ttcce);
…

I would prefer that a blank line will not be added directly after such a label.

Regards,
Markus
