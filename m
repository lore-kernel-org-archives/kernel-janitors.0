From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:25:24 +0000
Subject: [Kernel-janitors] [PATCH] synclink: replace jiffies_from_ms() with
Message-Id: <20040728182524.GM1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56534379576213967=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56534379576213967==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

-Nish

Applys-to: 2.6.7

Description: Uses msecs_to_jiffies() instead of the custom
jiffies_from_ms().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/synclink.c	2004-06-15 22:19:13.000000000 -0700
+++ linux-dev/drivers/char/synclink.c	2004-07-28 11:00:20.000000000 -0700
@@ -863,8 +863,6 @@ static int mgsl_rxenable(struct mgsl_str
 static int mgsl_wait_event(struct mgsl_struct * info, int __user *mask);
 static int mgsl_loopmode_send_done( struct mgsl_struct * info );
 
-#define jiffies_from_ms(a) ((((a) * HZ)/1000)+1)
-
 /* set non-zero on successful registration with PCI subsystem */
 static int pci_registered;
 
@@ -4187,7 +4185,7 @@ int load_next_tx_holding_buffer(struct m
 				info->get_tx_holding_index=0;
 
 			/* restart transmit timer */
-			mod_timer(&info->tx_timer, jiffies + jiffies_from_ms(5000));
+			mod_timer(&info->tx_timer, jiffies + msecs_to_jiffies(5000));
 
 			ret = 1;
 		}
@@ -5819,7 +5817,7 @@ void usc_start_transmitter( struct mgsl_
 			
 			usc_TCmd( info, TCmd_SendFrame );
 			
-			info->tx_timer.expires = jiffies + jiffies_from_ms(5000);
+			info->tx_timer.expires = jiffies + msecs_to_jiffies(5000);
 			add_timer(&info->tx_timer);	
 		}
 		info->tx_active = 1;
@@ -7214,7 +7212,7 @@ BOOLEAN mgsl_irq_test( struct mgsl_struc
 	EndTime=100;
 	while( EndTime-- && !info->irq_occurred ) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(jiffies_from_ms(10));
+		schedule_timeout(msecs_to_jiffies(10));
 	}
 	
 	spin_lock_irqsave(&info->irq_spinlock,flags);
@@ -7353,7 +7351,7 @@ BOOLEAN mgsl_dma_test( struct mgsl_struc
 	/*************************************************************/
 
 	/* Wait 100ms for interrupt. */
-	EndTime = jiffies + jiffies_from_ms(100);
+	EndTime = jiffies + msecs_to_jiffies(100);
 
 	for(;;) {
 		if (time_after(jiffies, EndTime)) {
@@ -7409,7 +7407,7 @@ BOOLEAN mgsl_dma_test( struct mgsl_struc
 	/**********************************/
 	
 	/* Wait 100ms */
-	EndTime = jiffies + jiffies_from_ms(100);
+	EndTime = jiffies + msecs_to_jiffies(100);
 
 	for(;;) {
 		if (time_after(jiffies, EndTime)) {
@@ -7451,7 +7449,7 @@ BOOLEAN mgsl_dma_test( struct mgsl_struc
 		/******************************/
 
 		/* Wait 100ms */
-		EndTime = jiffies + jiffies_from_ms(100);
+		EndTime = jiffies + msecs_to_jiffies(100);
 
 		/* While timer not expired wait for transmit complete */
 
@@ -7482,7 +7480,7 @@ BOOLEAN mgsl_dma_test( struct mgsl_struc
 		/* WAIT FOR RECEIVE COMPLETE */
 
 		/* Wait 100ms */
-		EndTime = jiffies + jiffies_from_ms(100);
+		EndTime = jiffies + msecs_to_jiffies(100);
 
 		/* Wait for 16C32 to write receive status to buffer entry. */
 		status=info->rx_buffer_list[0].status;

--===============56534379576213967==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56534379576213967==--
