From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 22 Oct 2019 08:26:41 +0000
Subject: Re: [PATCH] clocksource/drivers: Fix memory leak in ttc_setup_clockevent
Message-Id: <fb5d5331-9a89-8370-1e61-396dd05f291a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191021201848.4231-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021201848.4231-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> In the impelementation of ttc_setup_clockevent() the allocated memory
> for ttcce should be released if clk_notifier_register() fails.

* Please avoid the copying of typos from previous change descriptions.

* Under which circumstances will an “imperative mood” matter for you here?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n151


> +++ b/drivers/clocksource/timer-cadence-ttc.c
> @@ -424,6 +424,7 @@ static int __init ttc_setup_clockevent(struct clk *clk,
>  				    &ttcce->ttc.clk_rate_change_nb);
>  	if (err) {
>  		pr_warn("Unable to register clock notifier.\n");
> +		kfree(ttcce);
>  		return err;
>  	}

This addition looks correct.
But I would prefer to move such exception handling code to the end of
this function implementation so that duplicate source code will be reduced.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n450

Regards,
Markus
