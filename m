From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 02 May 2020 16:48:16 +0000
Subject: clk: keystone: Clarification for a return value check in _of_pll_clk_init()
Message-Id: <f1a2a717-f89b-d4c4-02aa-dd106eaed0a9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

I have tried another small script out for the semantic patch language.
This source code analysis approach points out that the function “clk_register_pll”
is called by the function “_of_pll_clk_init”.
https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/clk/keystone/pll.c#L153
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/keystone/pll.c?id=690e2aba7beb1ef06352803bea41a68a3c695015#n153

A null pointer check is performed at this place.
The function “clk_register_pll” (from the same source file) can eventually
return the pointer “ERR_PTR(-ENOMEM)”.
Is there a need to take this special case also into account?

Regards,
Markus
