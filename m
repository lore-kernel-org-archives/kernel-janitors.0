From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jun 2020 17:30:46 +0000
Subject: Re: [PATCH] clk: clk-st: Add missed return value checks in st_clk_probe()
Message-Id: <f0d21bd6-6db7-d643-b662-6ca26efd28ba@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chuhong Yuan <hslester96@gmail.com>, linux-clk@vger.kernel.org
Cc: Akshu Agrawal <Akshu.Agrawal@amd.com>, Daniel Kurtz <djkurtz@chromium.org>, Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> st_clk_probe() has not check for clk_hw_register_mux(), clk_hw_register_gate()
> and devm_clk_hw_register_clkdev().
> Add the missed checks and return devm_clk_hw_register_clkdev()'s return value
> to check errors.

How do you think about another wording variant?

   Return values were not checked after calls of the following functions.
   - clk_hw_register_mux
   - clk_hw_register_gate
   - devm_clk_hw_register_clkdev

   * Thus add error detection and the corresponding exception handling.

   * Return the value from the function call “devm_clk_hw_register_clkdev”
     at the end of this function implementation.

Regards,
Markus
