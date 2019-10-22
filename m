From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 22 Oct 2019 09:12:39 +0000
Subject: Re: [PATCH] clocksource/drivers/davinci: Fix memory leak in davinci_timer_register
Message-Id: <1d9f02d3-45ac-1d2f-457b-91cae123383d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191021202626.5246-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021202626.5246-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> In the impelementation of davinci_timer_register() the allocated memory
> for clockevent should be released if request_irq() fails.

* Please avoid the copying of typos from previous change descriptions.

* Under which circumstances will an “imperative mood” matter for you here?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n151


> +++ b/drivers/clocksource/timer-davinci.c
> @@ -299,6 +299,7 @@ int __init davinci_timer_register(struct clk *clk,
>  			 "clockevent/tim12", clockevent);
>  	if (rv) {
>  		pr_err("Unable to request the clockevent interrupt");
> +		kfree(clockevent);
>  		return rv;
>  	}

* Should a complete source code analysis point out that a similar fix
  will be needed also in the if branch after a failed call of
  the function “clocksource_register_hz”?

* Can any more exception handling become relevant because of previous
  resource allocations in this function implementation?

Regards,
Markus
