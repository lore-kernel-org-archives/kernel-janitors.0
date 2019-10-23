From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 23 Oct 2019 07:24:00 +0000
Subject: Re: [PATCH] clocksource/drivers: Fix error handling in ttc_setup_clocksource
Message-Id: <2cd566ee-0467-1e06-98dd-aacb3ca42e76@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023044737.2824-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191023044737.2824-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> In the implementation of ttc_setup_clocksource() when
> clk_notifier_register() fails the execution should go to error handling.
> Additionally, to avoid memory leak the allocated memory for ttccs should
> be released, too.

I got other wording preferences. Thus I imagine that such a change
description can still be improved another bit.

How do you think about to omit the word “should” for describing
the previous software situation?


> So, goto error handling to release the memory and return.

Would you like to express the addition of a jump target (according to
the Linux coding style) for the completion of desired exception handling
in a different way?

Regards,
Markus
