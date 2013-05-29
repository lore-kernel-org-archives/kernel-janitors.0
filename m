From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 21:09:55 +0000
Subject: [patch v2] leds: renesas-tpu: cleanup a small type issue
Message-Id: <20130529210955.GJ23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAK5ve-Jyb8xfyiy=iM_bLSF-uofQ9r8uNmuBryLVujKVJ-SALQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Static checkers complain that, although this is declared as an
unsigned long, we can only use the lower 32 bits.  For anything
higher, we hit bugs widening then bitwise negate or wrapping bugs
doing the left shift.

From looking at the context, this is not a problem because we only
use 16 bits.  I've changed some types to make it more clear.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Changed unsigned short to u16.  Re-wrote the commit message.

diff --git a/drivers/leds/leds-renesas-tpu.c b/drivers/leds/leds-renesas-tpu.c
index 9483f1c..adebf49 100644
--- a/drivers/leds/leds-renesas-tpu.c
+++ b/drivers/leds/leds-renesas-tpu.c
@@ -63,7 +63,7 @@ static DEFINE_SPINLOCK(r_tpu_lock);
 #define TGRC 8 /* Timer general register C (+0x20) */
 #define TGRD 9 /* Timer general register D (+0x24) */
 
-static inline unsigned short r_tpu_read(struct r_tpu_priv *p, int reg_nr)
+static inline u16 r_tpu_read(struct r_tpu_priv *p, int reg_nr)
 {
 	struct led_renesas_tpu_config *cfg = p->pdev->dev.platform_data;
 	void __iomem *base = p->mapbase;
@@ -75,8 +75,7 @@ static inline unsigned short r_tpu_read(struct r_tpu_priv *p, int reg_nr)
 	return ioread16(base + offs);
 }
 
-static inline void r_tpu_write(struct r_tpu_priv *p, int reg_nr,
-			       unsigned short value)
+static inline void r_tpu_write(struct r_tpu_priv *p, int reg_nr, u16 value)
 {
 	struct led_renesas_tpu_config *cfg = p->pdev->dev.platform_data;
 	void __iomem *base = p->mapbase;
@@ -93,7 +92,8 @@ static inline void r_tpu_write(struct r_tpu_priv *p, int reg_nr,
 static void r_tpu_start_stop_ch(struct r_tpu_priv *p, int start)
 {
 	struct led_renesas_tpu_config *cfg = p->pdev->dev.platform_data;
-	unsigned long flags, value;
+	unsigned long flags;
+	u16 value;
 
 	/* start stop register shared by multiple timer channels */
 	spin_lock_irqsave(&r_tpu_lock, flags);
