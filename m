From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:26:24 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/synclinkmp: replace
Message-Id: <20040728182624.GN1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88649895759418862=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040728182421.GL1935@us.ibm.com>
In-Reply-To: <20040728182421.GL1935@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============88649895759418862==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

-Nish

Applys-to: 2.6.7

Description: Uses msecs_to_jiffies() instead of the custom
jiffies_from_ms().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/synclinkmp.c	2004-06-15 22:19:01.000000000 -0700
+++ linux-dev/drivers/char/synclinkmp.c	2004-07-28 11:01:13.000000000 -0700
@@ -458,8 +458,6 @@ typedef struct _synclinkmp_info {
 #define CRCE	BIT2
 
 
-#define jiffies_from_ms(a) ((((a) * HZ)/1000)+1)
-
 /*
  * Global linked list of SyncLink devices
  */
@@ -2572,7 +2570,7 @@ static int startup(SLMP_INFO * info)
 
 	change_params(info);
 
-	info->status_timer.expires = jiffies + jiffies_from_ms(10);
+	info->status_timer.expires = jiffies + msecs_to_jiffies(10);
 	add_timer(&info->status_timer);
 
 	if (info->tty)
@@ -4128,7 +4126,7 @@ void tx_start(SLMP_INFO *info)
 			write_reg(info, TXDMA + DIR, 0x40);		/* enable Tx DMA interrupts (EOM) */
 			write_reg(info, TXDMA + DSR, 0xf2);		/* clear Tx DMA IRQs, enable Tx DMA */
 	
-			info->tx_timer.expires = jiffies + jiffies_from_ms(5000);
+			info->tx_timer.expires = jiffies + msecs_to_jiffies(5000);
 			add_timer(&info->tx_timer);
 		}
 		else {
@@ -5016,7 +5014,7 @@ int irq_test(SLMP_INFO *info)
 	timeout=100;
 	while( timeout-- && !info->irq_occurred ) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(jiffies_from_ms(10));
+		schedule_timeout(msecs_to_jiffies(10));
 	}
 
 	spin_lock_irqsave(&info->lock,flags);
@@ -5167,7 +5165,7 @@ int loopback_test(SLMP_INFO *info)
 	/* Set a timeout for waiting for interrupt. */
 	for ( timeout = 100; timeout; --timeout ) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(jiffies_from_ms(10));
+		schedule_timeout(msecs_to_jiffies(10));
 
 		if (rx_get_frame(info)) {
 			rc = TRUE;
@@ -5423,7 +5421,7 @@ void status_timeout(unsigned long contex
 
 	info->status_timer.data = (unsigned long)info;
 	info->status_timer.function = status_timeout;
-	info->status_timer.expires = jiffies + jiffies_from_ms(10);
+	info->status_timer.expires = jiffies + msecs_to_jiffies(10);
 	add_timer(&info->status_timer);
 }
 

--===============88649895759418862==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88649895759418862==--
