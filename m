From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:20:02 +0000
Subject: [Kernel-janitors] [PATCH 4/5] atm/idt77252: replace
Message-Id: <20040915182002.GG4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4797416081373016=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915181826.GE4363@us.ibm.com>
In-Reply-To: <20040915181826.GE4363@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============4797416081373016==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, wrong subject line. Any comments would be appreciated.

Description: msleep_interruptible() is used instead of schedule_timeout()
to guarantee the task delays as expected. To achieve this, the timeout
variable is converted from an int to an unsigned long, and it's values
are changed accordingly.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc2-vanilla/drivers/atm/idt77252.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/atm/idt77252.c	2004-09-14 11:34:25.000000000 -0700
@@ -2516,7 +2516,7 @@ idt77252_close(struct atm_vcc *vcc)
 	struct vc_map *vc = vcc->dev_data;
 	unsigned long flags;
 	unsigned long addr;
-	int timeout;
+	unsigned long timeout;
 
 	down(&card->mutex);
 
@@ -2566,9 +2566,9 @@ done:
 		}
 		spin_unlock_irqrestore(&vc->lock, flags);
 
-		timeout = 5 * HZ;
+		timeout = 5 * 1000;
 		while (atomic_read(&vc->scq->used) > 0) {
-			timeout = schedule_timeout(timeout);
+			timeout = msleep_interruptible(timeout);
 			if (!timeout)
 				break;
 		}

--===============4797416081373016==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4797416081373016==--
