From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 16 Oct 2019 06:24:10 +0000
Subject: Re: clk: rockchip: Checking a kmemdup() call in rockchip_clk_register_pll()
Message-Id: <e4540cb0-7fcc-ce1e-f687-c725f5e8b209@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
 <2588953.0pqkEXWxhN@phil> <45588ab8-2a6c-3f29-61ff-bccf8d6fb291@web.de>
 <5173392.uhhkXBHGmO@phil>
In-Reply-To: <5173392.uhhkXBHGmO@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>, kernel-janitors@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Aditya Pakki <pakki001@umn.edu>

>> Would you like to adjust such exception handling another bit?
>
> Nope.
>
> The big difference is that clocks rely heavily on their names to establish
> the clock tree parentship. So the PLL cannot work without the name

This error situation got a specific reaction.


> but can provide some means of functionality without the rate-table
> especially as bootloaders do generally initialize a PLL to some form of
> sane frequency.

I imagine that a choice is available here for the error handling strategy.

* Return “ERR_PTR(-ENOMEM)” as a strict response like in the other error case.

* Fix the setting “pll->rate_count” at least (to be a bit more tolerant).
  Would any system users wonder then about the availability of only
  a single frequency (instead of possibly expected alternatives)?

Regards,
Markus
