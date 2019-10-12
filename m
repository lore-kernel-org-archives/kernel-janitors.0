From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 13:55:44 +0000
Subject: clk: rockchip: Checking a kmemdup() call in rockchip_clk_register_pll()
Message-Id: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “rockchip_clk_register_pll” contains also a call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/clk-pll.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n913
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/rockchip/clk-pll.c#L913

* Do you find the usage of the format string “%s: could not allocate
  rate table for %s\n” still appropriate at this place?

* Is there a need to adjust the error handling here?

Regards,
Markus
