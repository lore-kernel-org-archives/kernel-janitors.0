From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:27:02 +0000
Subject: [KJ] [PATCH 25/39] serial/crisv10: replace schedule_timeout() with
Message-Id: <20050121192702.GF3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57015060218382485=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57015060218382485==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not care
about signals, so I believe msleep() should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/serial/crisv10.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/serial/crisv10.c	2005-01-17 16:50:45.000000000 -0800
@@ -3757,10 +3757,8 @@ rs_write(struct tty_struct * tty, int fr
 		e100_enable_rx_irq(info);
 #endif
 
-		if (info->rs485.delay_rts_before_send > 0) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout((info->rs485.delay_rts_before_send * HZ)/1000);
-		}
+		if (info->rs485.delay_rts_before_send > 0)
+			msleep(info->rs485.delay_rts_before_send);
 	}
 #endif /* CONFIG_ETRAX_RS485 */
 

--===============57015060218382485==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57015060218382485==--
