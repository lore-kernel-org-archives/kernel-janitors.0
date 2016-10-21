From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:08:27 +0000
Subject: [PATCH 3/6] FRV-setup: Add some spaces for better code readability
Message-Id: <4d07dc3e-b6a5-bdf6-a732-4171d7fd6156@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 22:05:55 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index 7570ff0..577bcf5 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -121,23 +121,23 @@ struct clock_cmode {
 	uint8_t	xbus, sdram, corebus, core, dsu;
 };
 
-#define _frac(N,D) ((N)<<4 | (D))
-#define _x0_16	_frac(1,6)
-#define _x0_25	_frac(1,4)
-#define _x0_33	_frac(1,3)
-#define _x0_375	_frac(3,8)
-#define _x0_5	_frac(1,2)
-#define _x0_66	_frac(2,3)
-#define _x0_75	_frac(3,4)
-#define _x1	_frac(1,1)
-#define _x1_5	_frac(3,2)
-#define _x2	_frac(2,1)
-#define _x3	_frac(3,1)
-#define _x4	_frac(4,1)
-#define _x4_5	_frac(9,2)
-#define _x6	_frac(6,1)
-#define _x8	_frac(8,1)
-#define _x9	_frac(9,1)
+#define _frac(N, D) ((N) << 4 | (D))
+#define _x0_16	_frac(1, 6)
+#define _x0_25	_frac(1, 4)
+#define _x0_33	_frac(1, 3)
+#define _x0_375	_frac(3, 8)
+#define _x0_5	_frac(1, 2)
+#define _x0_66	_frac(2, 3)
+#define _x0_75	_frac(3, 4)
+#define _x1	_frac(1, 1)
+#define _x1_5	_frac(3, 2)
+#define _x2	_frac(2, 1)
+#define _x3	_frac(3, 1)
+#define _x4	_frac(4, 1)
+#define _x4_5	_frac(9, 2)
+#define _x6	_frac(6, 1)
+#define _x8	_frac(8, 1)
+#define _x9	_frac(9, 1)
 
 int __nongprelbss clock_p0_current;
 int __nongprelbss clock_cm_current;
@@ -574,7 +574,7 @@ void __pminit determine_clocks(int verbose)
 			mode = tmode;
 	}
 
-#define CLOCK(SRC,RATIO) ((SRC) * (((RATIO) >> 4) & 0x0f) / ((RATIO) & 0x0f))
+#define CLOCK(SRC, RATIO) ((SRC) * (((RATIO) >> 4) & 0x0f) / ((RATIO) & 0x0f))
 
 	if (clock_doubled)
 		__clkin_clock_speed_HZ <<= 1;
@@ -1161,8 +1161,8 @@ static void __init mb93090_display(void)
 
 	/* set up the LCD */
 	mb93090_sendlcdcmd(LCD_CMD_CLEAR);
-	mb93090_sendlcdcmd(LCD_CMD_FUNCSET(1,1,0));
-	mb93090_sendlcdcmd(LCD_CMD_ON(0,0));
+	mb93090_sendlcdcmd(LCD_CMD_FUNCSET(1, 1, 0));
+	mb93090_sendlcdcmd(LCD_CMD_ON(0, 0));
 	mb93090_sendlcdcmd(LCD_CMD_HOME);
 
 	mb93090_sendlcdcmd(LCD_CMD_SET_DD_ADDR(0));
-- 
2.10.1

