From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Apr 2020 04:17:09 +0000
Subject: [PATCH] clk: renesas: r9a06g032: Fix some typo in comments
Message-Id: <20200413041709.3630-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This file seems to be for R9A06G032 only. So replace reference to
R9A09G032 by R9A06G032 to avoid confusion.

AFAIK, R9A09G032 does'nt exist.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1907ee195a08..d900f6bf53d0 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R9A09G032 clock driver
+ * R9A06G032 clock driver
  *
  * Copyright (C) 2018 Renesas Electronics Europe Limited
  *
@@ -338,8 +338,8 @@ clk_rdesc_get(struct r9a06g032_priv *clocks,
 }
 
 /*
- * This implements the R9A09G032 clock gate 'driver'. We cannot use the system's
- * clock gate framework as the gates on the R9A09G032 have a special enabling
+ * This implements the R9A06G032 clock gate 'driver'. We cannot use the system's
+ * clock gate framework as the gates on the R9A06G032 have a special enabling
  * sequence, therefore we use this little proxy.
  */
 struct r9a06g032_clk_gate {
-- 
2.20.1
