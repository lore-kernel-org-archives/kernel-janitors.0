From: Isaac Lleida <isakyllr@openmailbox.org>
Date: Fri, 13 Mar 2015 16:48:36 +0000
Subject: [PATCH] staging: panel: change struct bits to a bit array
Message-Id: <1426265316-17947-1-git-send-email-isakyllr@openmailbox.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: isaky <illeida@openaliasbox.org>

This path implements a bit array representing the LCD signal states instead of the old "struct bits", which used char to represent a single bit. This will reduce the memory usage.

Signed-off-by: Isaac Lleida <illeida@openaliasbox.org>
---
 drivers/staging/panel/panel.c | 86 ++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
index 3339633..7deb092 100644
--- a/drivers/staging/panel/panel.c
+++ b/drivers/staging/panel/panel.c
@@ -310,6 +310,25 @@ static int selected_lcd_type = NOT_SET;
 #define LCD_BITS	6
 
 /*
+ * LCD signal states
+ */
+#define LCD_BIT_E_MASK		0x1	/* E (data latch on falling edge) */
+#define LCD_BIT_RS_MASK		0x2	/* RS  (0 = cmd, 1 = data) */
+#define LCD_BIT_RW_MASK		0x4	/* R/W (0 = W, 1 = R) */
+#define LCD_BIT_BL_MASK		0x8	/* backlight (0 = off, 1 = on) */
+#define LCD_BIT_CL_MASK		0x10	/* clock (latch on rising edge) */
+#define LCD_BIT_DA_MASK		0x20	/* data */
+
+/*
+ * Bit array operations
+ */
+#define BIT_ON(b, m)	(b |= m)
+#define BIT_OFF(b, m)	(b &= ~m)
+#define BIT_CHK(b, m)	(b & m)
+#define BIT_MOD(b, m, v)			\
+	((v) ? BIT_ON(b, m) : BIT_OFF(b, m))	\
+
+/*
  * each bit can be either connected to a DATA or CTRL port
  */
 #define LCD_PORT_C	0
@@ -653,15 +672,8 @@ static const char nexcom_keypad_profile[][4][9] = {
 
 static const char (*keypad_profile)[4][9] = old_keypad_profile;
 
-/* FIXME: this should be converted to a bit array containing signals states */
-static struct {
-	unsigned char e;  /* parallel LCD E (data latch on falling edge) */
-	unsigned char rs; /* parallel LCD RS  (0 = cmd, 1 = data) */
-	unsigned char rw; /* parallel LCD R/W (0 = W, 1 = R) */
-	unsigned char bl; /* parallel LCD backlight (0 = off, 1 = on) */
-	unsigned char cl; /* serial LCD clock (latch on rising edge) */
-	unsigned char da; /* serial LCD data */
-} bits;
+/* Bit array containing signals states */
+static char bits;
 
 static void init_scan_timer(void);
 
@@ -674,12 +686,12 @@ static int set_data_bits(void)
 	for (bit = 0; bit < LCD_BITS; bit++)
 		val &= lcd_bits[LCD_PORT_D][bit][BIT_MSK];
 
-	val |= lcd_bits[LCD_PORT_D][LCD_BIT_E][bits.e]
-	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][bits.rs]
-	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][bits.rw]
-	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][bits.bl]
-	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][bits.cl]
-	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][bits.da];
+	val |= lcd_bits[LCD_PORT_D][LCD_BIT_E][BIT_CHK(bits, LCD_BIT_E_MASK)]
+	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][BIT_CHK(bits, LCD_BIT_RS_MASK)]
+	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][BIT_CHK(bits, LCD_BIT_RW_MASK)]
+	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
+	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][BIT_CHK(bits, LCD_BIT_CL_MASK)]
+	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][BIT_CHK(bits, LCD_BIT_DA_MASK)];
 
 	w_dtr(pprt, val);
 	return val;
@@ -694,12 +706,12 @@ static int set_ctrl_bits(void)
 	for (bit = 0; bit < LCD_BITS; bit++)
 		val &= lcd_bits[LCD_PORT_C][bit][BIT_MSK];
 
-	val |= lcd_bits[LCD_PORT_C][LCD_BIT_E][bits.e]
-	    | lcd_bits[LCD_PORT_C][LCD_BIT_RS][bits.rs]
-	    | lcd_bits[LCD_PORT_C][LCD_BIT_RW][bits.rw]
-	    | lcd_bits[LCD_PORT_C][LCD_BIT_BL][bits.bl]
-	    | lcd_bits[LCD_PORT_C][LCD_BIT_CL][bits.cl]
-	    | lcd_bits[LCD_PORT_C][LCD_BIT_DA][bits.da];
+	val |= lcd_bits[LCD_PORT_C][LCD_BIT_E][BIT_CHK(bits, LCD_BIT_E_MASK)]
+	    | lcd_bits[LCD_PORT_C][LCD_BIT_RS][BIT_CHK(bits, LCD_BIT_RS_MASK)]
+	    | lcd_bits[LCD_PORT_C][LCD_BIT_RW][BIT_CHK(bits, LCD_BIT_RW_MASK)]
+	    | lcd_bits[LCD_PORT_C][LCD_BIT_BL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
+	    | lcd_bits[LCD_PORT_C][LCD_BIT_CL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
+	    | lcd_bits[LCD_PORT_C][LCD_BIT_DA][BIT_CHK(bits, LCD_BIT_DA_MASK)];
 
 	w_ctr(pprt, val);
 	return val;
@@ -794,12 +806,12 @@ static void lcd_send_serial(int byte)
 	/* the data bit is set on D0, and the clock on STROBE.
 	 * LCD reads D0 on STROBE's rising edge. */
 	for (bit = 0; bit < 8; bit++) {
-		bits.cl = BIT_CLR;	/* CLK low */
+		BIT_OFF(bits, LCD_BIT_CL_MASK);	/* CLK low */
 		panel_set_bits();
-		bits.da = byte & 1;
+		BIT_MOD(bits, LCD_BIT_DA_MASK, byte & 1);
 		panel_set_bits();
 		udelay(2);  /* maintain the data during 2 us before CLK up */
-		bits.cl = BIT_SET;	/* CLK high */
+		BIT_ON(bits, LCD_BIT_CL_MASK);	/* CLK high */
 		panel_set_bits();
 		udelay(1);  /* maintain the strobe during 1 us */
 		byte >>= 1;
@@ -814,7 +826,7 @@ static void lcd_backlight(int on)
 
 	/* The backlight is activated by setting the AUTOFEED line to +5V  */
 	spin_lock_irq(&pprt_lock);
-	bits.bl = on;
+	BIT_MOD(bits, LCD_BIT_BL_MASK, on);
 	panel_set_bits();
 	spin_unlock_irq(&pprt_lock);
 }
@@ -849,14 +861,14 @@ static void lcd_write_cmd_p8(int cmd)
 	w_dtr(pprt, cmd);
 	udelay(20);	/* maintain the data during 20 us before the strobe */
 
-	bits.e = BIT_SET;
-	bits.rs = BIT_CLR;
-	bits.rw = BIT_CLR;
+	BIT_ON(bits, LCD_BIT_E_MASK);
+	BIT_OFF(bits, LCD_BIT_RS_MASK);
+	BIT_OFF(bits, LCD_BIT_RW_MASK);
 	set_ctrl_bits();
 
 	udelay(40);	/* maintain the strobe during 40 us */
 
-	bits.e = BIT_CLR;
+	BIT_OFF(bits, LCD_BIT_E_MASK);
 	set_ctrl_bits();
 
 	udelay(120);	/* the shortest command takes at least 120 us */
@@ -871,14 +883,14 @@ static void lcd_write_data_p8(int data)
 	w_dtr(pprt, data);
 	udelay(20);	/* maintain the data during 20 us before the strobe */
 
-	bits.e = BIT_SET;
-	bits.rs = BIT_SET;
-	bits.rw = BIT_CLR;
+	BIT_ON(bits, LCD_BIT_E_MASK);
+	BIT_OFF(bits, LCD_BIT_RS_MASK);
+	BIT_OFF(bits, LCD_BIT_RW_MASK);
 	set_ctrl_bits();
 
 	udelay(40);	/* maintain the strobe during 40 us */
 
-	bits.e = BIT_CLR;
+	BIT_OFF(bits, LCD_BIT_E_MASK);
 	set_ctrl_bits();
 
 	udelay(45);	/* the shortest data takes at least 45 us */
@@ -968,15 +980,15 @@ static void lcd_clear_fast_p8(void)
 		/* maintain the data during 20 us before the strobe */
 		udelay(20);
 
-		bits.e = BIT_SET;
-		bits.rs = BIT_SET;
-		bits.rw = BIT_CLR;
+		BIT_ON(bits, LCD_BIT_E_MASK);
+		BIT_OFF(bits, LCD_BIT_RS_MASK);
+		BIT_OFF(bits, LCD_BIT_RW_MASK);
 		set_ctrl_bits();
 
 		/* maintain the strobe during 40 us */
 		udelay(40);
 
-		bits.e = BIT_CLR;
+		BIT_OFF(bits, LCD_BIT_E_MASK);
 		set_ctrl_bits();
 
 		/* the shortest data takes at least 45 us */
-- 
2.3.2

