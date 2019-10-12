From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 14:17:03 +0000
Subject: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <c1bc5e4d-0802-4485-2c07-248bab2a3330@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “_samsung_clk_register_pll” contains also a call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-pll.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1275
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/samsung/clk-pll.c#L1275

* Do you find the usage of the format string “%s: could not allocate
  rate table for %s\n” still appropriate at this place?

* Is there a need to adjust the error handling here?

Regards,
Markus
