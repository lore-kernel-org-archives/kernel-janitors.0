From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Sat, 12 Oct 2019 21:32:12 +0000
Subject: Re: clk: rockchip: Checking a kmemdup() call in rockchip_clk_register_pll()
Message-Id: <5801053.xxhhKtLrcJ@diego>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
In-Reply-To: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Kangjie Lu <kjlu@umn.edu>, Michael Turquette <mturquette@baylibre.com>, Stephen McCamant <smccaman@umn.edu>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Navid Emamdoost <emamd001@umn.edu>, Aditya Pakki <pakki001@umn.edu>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Markus,

Am Samstag, 12. Oktober 2019, 15:55:44 CEST schrieb Markus Elfring:
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “rockchip_clk_register_pll” contains also a call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/clk-pll.c?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n913
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/rockchip/clk-pll.c#L913
> 
> * Do you find the usage of the format string “%s: could not allocate
>   rate table for %s\n” still appropriate at this place?

If there is an internal "no-memory" output from inside kmemdup now,
I guess the one in the clock driver would be a duplicate and could go away.

> * Is there a need to adjust the error handling here?

There is no need for additional error handling. Like if the rate-table
could not be duplicated, the clock will still report the correct clockrate
you can just not set a new rate.

And for a system it's always better to have the clock driver present
than for all device-drivers to fail probing. Especially as this start as
core clock driver, so there is no deferring possible.

Heiko
