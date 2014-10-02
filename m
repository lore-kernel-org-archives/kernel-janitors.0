From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 02 Oct 2014 07:53:30 +0000
Subject: [PATCH 0/2] Couple of changes to gpio-gate-clock
Message-Id: <cover.1412234778.git.jsarha@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, kernel-janitors@vger.kernel.org
Cc: dan.carpenter@oracle.com, detheridge@ti.com, Jyri Sarha <jsarha@ti.com>

The first was suggested by Dan Carpenter. The second is just cleaning
and not affecting the functionality.

Jyri Sarha (2):
  clk: gpio-gate: Stop using devres API
  clk: gpio-gate: Rename the struct from clk_gpio to clk_gpio_gate

 drivers/clk/clk-gpio-gate.c  |   34 ++++++++++++----------------------
 include/linux/clk-provider.h |    2 +-
 2 files changed, 13 insertions(+), 23 deletions(-)

-- 
1.7.9.5

