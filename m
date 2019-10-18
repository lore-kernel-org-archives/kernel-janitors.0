From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 18 Oct 2019 18:42:27 +0000
Subject: clk: bcm2835: Checking a clk_register() call in bcm2835_clk_probe()
Message-Id: <522fb1f3-d710-2f86-60b1-4224b8d3d17a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “bcm2835_clk_probe” contains still
an unchecked call of the member function “clk_register”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/bcm/clk-bcm2835.c?id=7571438a4868e7cb09d698ab52e54f9722020eef#n2243
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/bcm/clk-bcm2835.c#L2243

How do you think about to improve it?

* Which error code would you like to return for a failed
  clock registration at this place?

* Will it be needed to delete any information about clocks
  as exception handling?

Regards,
Markus
