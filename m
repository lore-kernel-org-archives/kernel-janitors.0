From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 07:02:45 +0000
Subject: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <20130529070150.GC25133@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers complain that this is declared as an unsigned long
but we only ever use the low 32 bits (ignoring sign expansion).
But from the context, it should just be an unsigned short.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-renesas-tpu.c b/drivers/leds/leds-renesas-tpu.c
index 9483f1c..fe1fbd0 100644
--- a/drivers/leds/leds-renesas-tpu.c
+++ b/drivers/leds/leds-renesas-tpu.c
@@ -93,7 +93,8 @@ static inline void r_tpu_write(struct r_tpu_priv *p, int reg_nr,
 static void r_tpu_start_stop_ch(struct r_tpu_priv *p, int start)
 {
 	struct led_renesas_tpu_config *cfg = p->pdev->dev.platform_data;
-	unsigned long flags, value;
+	unsigned long flags;
+	unsigned short value;
 
 	/* start stop register shared by multiple timer channels */
 	spin_lock_irqsave(&r_tpu_lock, flags);
