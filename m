From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:38:05 +0000
Subject: [KJ] [PATCH 28/39] sound/gus_reset: replace schedule_timeout() with
Message-Id: <20050121193805.GI3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68459101905557618=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68459101905557618==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep_interruptible() instead of custom wait code involving
schedule_timeout() to guarantee the task delays as expected. This also removes a
dependence on the value of HZ.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/isa/gus/gus_reset.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/sound/isa/gus/gus_reset.c	2005-01-18 13:30:43.000000000 -0800
@@ -207,7 +207,6 @@ void snd_gf1_stop_voices(snd_gus_card_t 
 	unsigned long flags;
 	short i, ramp_ok;
 	unsigned short ramp_end;
-	long time;
 
 	if (!in_interrupt()) {	/* this can't be done in interrupt */
 		for (i = v_min, ramp_ok = 0; i <= v_max; i++) {
@@ -227,11 +226,7 @@ void snd_gf1_stop_voices(snd_gus_card_t 
 			}
 			spin_unlock_irqrestore(&gus->reg_lock, flags);
 		}
-		time = HZ / 20;
-		while (time > 0 && !signal_pending(current)) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			time = schedule_timeout(time);
-		}
+		msleep_interruptible(50);
 	}
 	snd_gf1_clear_voices(gus, v_min, v_max);
 }

--===============68459101905557618==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68459101905557618==--
