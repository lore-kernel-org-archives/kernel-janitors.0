From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:50:46 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/atm/nicstar.c: replace
Message-Id: <20051023025046.GB2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5921729172424377=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023024655.GA2438@poopie.dyndns.org>
In-Reply-To: <20051023024655.GA2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============5921729172424377==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/atm/nicstar.c: replace interruptible_sleep_on_timeout() with
wait_event_interruptible_timeout()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/atm/nicstar.c mod/drivers/atm/nicstar.c
--- 2.6.14-rc5/drivers/atm/nicstar.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/atm/nicstar.c	2005-10-22 14:38:35.000000000 -0500
@@ -1905,7 +1905,7 @@ static int push_scqe(ns_dev *card, vc_ma
 
       scq->full = 1;
       spin_unlock_irqrestore(&scq->lock, flags);
-      interruptible_sleep_on_timeout(&scq->scqfull_waitq, SCQFULL_TIMEOUT);
+      wait_event_interruptible_timeout(scq->scqfull_waitq, !scq->full, SCQFULL_TIMEOUT);
       ns_grab_scq_lock(card, scq, flags);
 
       if (scq->full) {
@@ -1954,7 +1954,7 @@ static int push_scqe(ns_dev *card, vc_ma
          scq->full = 1;
          if (has_run++) break;
          spin_unlock_irqrestore(&scq->lock, flags);
-         interruptible_sleep_on_timeout(&scq->scqfull_waitq, SCQFULL_TIMEOUT);
+         wait_event_interruptible_timeout(scq->scqfull_waitq, !scq->full, SCQFULL_TIMEOUT);
          ns_grab_scq_lock(card, scq, flags);
       }
 



--===============5921729172424377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5921729172424377==--
