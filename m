From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 16 Sep 2004 14:46:50 +0000
Subject: Re: [Kernel-janitors] [PATCH 4/5] atm/idt77252: replace
Message-Id: <20040916074650.53b2d5a5.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58592285609782402=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915181826.GE4363@us.ibm.com>
In-Reply-To: <20040915181826.GE4363@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============58592285609782402==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


[This is from Walter Harms, but several of his messages
don't make it thru the email system for some reason... --Randy]



HZ may vary between different architectures. was that the autors real
intend ?

-		timeout = 5 * HZ;
+		timeout = 5 * 1000;


mfg
wh

[Randy says:]  I agree with Walter.  That change looks suspicious
or incorrect.

- - - - - - - - - - - - - - Original Message - - - - - - - - - - - - - -
From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: [Kernel-janitors] [PATCH 4/5] atm/idt77252: replace schedule_ti
Date: 09/15/04 20:18

Any comments would be appreciated.


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


--===============58592285609782402==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58592285609782402==--
