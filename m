From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:26:46 +0000
Subject: [KJ] [RFC][PATCH 4/5] ppc/serial_sicc: use poll_event*() interface
Message-Id: <20050303182646.GG11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87563298392041133=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87563298392041133==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Use new poll_event*() interface to encapsulate sleep-loops.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/arch/ppc/4xx_io/serial_sicc.c	2005-03-02 11:21:41.000000000 -0800
+++ 2.6.11-kj/arch/ppc/4xx_io/serial_sicc.c	2005-03-02 17:47:44.000000000 -0800
@@ -1500,16 +1500,14 @@ static void siccuart_wait_until_sent(str
 	pr_debug
 	    ("siccuart_wait_until_sent(%d), jiff=%lu, expire=%lu  char_time=%lu...\n",
 	     tty->index, jiffies, expire, char_time);
-	while ((readb(info->port->uart_base + BL_SICC_LSR) & _LSR_TX_ALL) !=
-	       _LSR_TX_ALL) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(char_time);
-		if (signal_pending(current))
-			break;
-		if (timeout && time_after(jiffies, expire))
-			break;
-	}
-	set_current_state(TASK_RUNNING);
+	if (timeout)
+		poll_event_interruptible_timeout(((readb(info->port->uart_base +
+						BL_SICC_LSR) & _LSR_TX_ALL) == _LSR_TX_ALL),
+						jiffies_to_msecs(char_time), timeout);
+	else
+		poll_event_interruptible(((readb(info->port->uart_base +
+					BL_SICC_LSR) & _LSR_TX_ALL) == _LSR_TX_ALL),
+					jiffies_to_msecs(char_time));
 }
 
 static void siccuart_hangup(struct tty_struct *tty)

--===============87563298392041133==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87563298392041133==--
