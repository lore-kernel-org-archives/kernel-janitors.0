From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Oct 2018 19:13:00 +0000
Subject: [PATCH][V2] tlclk: clean an indentation issue, remove extraneous tabs
Message-Id: <20181031191300.6515-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Gross <mark.gross@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove tabs

---

V2: Put { } braces around else statement

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/tlclk.c | 87 ++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index 8eeb4190207d..6d81bb3bb503 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -506,28 +506,28 @@ static ssize_t store_select_amcb2_transmit_clock(struct device *d,
 
 	val = (unsigned char)tmp;
 	spin_lock_irqsave(&event_lock, flags);
-		if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
-			SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x28);
-			SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
-		} else if (val >= CLK_8_592MHz) {
-			SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x38);
-			switch (val) {
-			case CLK_8_592MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
-				break;
-			case CLK_11_184MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
-				break;
-			case CLK_34_368MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
-				break;
-			case CLK_44_736MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);
-				break;
-			}
-		} else
-			SET_PORT_BITS(TLCLK_REG3, 0xc7, val << 3);
-
+	if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
+		SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x28);
+		SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
+	} else if (val >= CLK_8_592MHz) {
+		SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x38);
+		switch (val) {
+		case CLK_8_592MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
+			break;
+		case CLK_11_184MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
+			break;
+		case CLK_34_368MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
+			break;
+		case CLK_44_736MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);
+			break;
+		}
+	} else {
+		SET_PORT_BITS(TLCLK_REG3, 0xc7, val << 3);
+	}
 	spin_unlock_irqrestore(&event_lock, flags);
 
 	return strnlen(buf, count);
@@ -548,27 +548,28 @@ static ssize_t store_select_amcb1_transmit_clock(struct device *d,
 
 	val = (unsigned char)tmp;
 	spin_lock_irqsave(&event_lock, flags);
-		if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
-			SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x5);
-			SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
-		} else if (val >= CLK_8_592MHz) {
-			SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x7);
-			switch (val) {
-			case CLK_8_592MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
-				break;
-			case CLK_11_184MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
-				break;
-			case CLK_34_368MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
-				break;
-			case CLK_44_736MHz:
-				SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);
-				break;
-			}
-		} else
-			SET_PORT_BITS(TLCLK_REG3, 0xf8, val);
+	if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
+		SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x5);
+		SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
+	} else if (val >= CLK_8_592MHz) {
+		SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x7);
+		switch (val) {
+		case CLK_8_592MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
+			break;
+		case CLK_11_184MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
+			break;
+		case CLK_34_368MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
+			break;
+		case CLK_44_736MHz:
+			SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);
+			break;
+		}
+	} else {
+		SET_PORT_BITS(TLCLK_REG3, 0xf8, val);
+	}
 	spin_unlock_irqrestore(&event_lock, flags);
 
 	return strnlen(buf, count);
-- 
2.19.1
