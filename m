From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:46:55 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/atm/firestream.c: convert
Message-Id: <20051023024655.GA2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2495625499076235=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2495625499076235==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/atm/firestream.c: replace interruptible_sleep_on() with
wait_event_interruptible(). Also, reorder wake_up_interruptible() to prevent
race condition

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/atm/firestream.c mod/drivers/atm/firestream.c
--- 2.6.14-rc5/drivers/atm/firestream.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/atm/firestream.c	2005-10-22 14:41:14.000000000 -0500
@@ -734,8 +734,8 @@ static void process_txdone_queue (struct
       
 			skb = td->skb;
 			if (skb == FS_VCC (ATM_SKB(skb)->vcc)->last_skb) {
-				wake_up_interruptible (& FS_VCC (ATM_SKB(skb)->vcc)->close_wait);
 				FS_VCC (ATM_SKB(skb)->vcc)->last_skb = NULL;
+				wake_up_interruptible (& FS_VCC (ATM_SKB(skb)->vcc)->close_wait);
 			}
 			td->dev->ntxpckts--;
 
@@ -1113,10 +1113,10 @@ static void fs_close(struct atm_vcc *atm
 		   be impolite not to send them don't you think? 
 		   XXX
 		   We don't know which packets didn't get sent. So if we get interrupted in 
-		   this sleep_on, we'll lose any reference to these packets. Memory leak!
+		   this wait_event, we'll lose any reference to these packets. Memory leak!
 		   On the other hand, it's awfully convenient that we can abort a "close" that
 		   is taking too long. Maybe just use non-interruptible sleep on? -- REW */
-		interruptible_sleep_on (& vcc->close_wait);
+		wait_event_interruptible (vcc->close_wait, !vcc->last_skb);
 	}
 
 	txtp = &atm_vcc->qos.txtp;



--===============2495625499076235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2495625499076235==--
