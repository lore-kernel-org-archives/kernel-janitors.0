From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:15 +0000
Subject: [PATCH 01/14] avr32/mach-at32ap/clock: check return code of clk_get
Message-Id: <1283711535-7082-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

Function clk_get may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 arch/avr32/mach-at32ap/clock.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/avr32/mach-at32ap/clock.c b/arch/avr32/mach-at32ap/clock.c
index 442f08c..133a475 100644
--- a/arch/avr32/mach-at32ap/clock.c
+++ b/arch/avr32/mach-at32ap/clock.c
@@ -258,14 +258,20 @@ static int clk_show(struct seq_file *s, void *unused)
 
 	/* show clock tree as derived from the three oscillators */
 	clk = clk_get(NULL, "osc32k");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 	dump_clock(clk, &r);
 	clk_put(clk);
 
 	clk = clk_get(NULL, "osc0");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 	dump_clock(clk, &r);
 	clk_put(clk);
 
 	clk = clk_get(NULL, "osc1");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 	dump_clock(clk, &r);
 	clk_put(clk);
 
-- 
1.7.0.4

