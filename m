From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:49:29 +0000
Subject: [KJ] [PATCH 31/39] sound/wavefront_synth: insert
Message-Id: <20050121194929.GL3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99957595147274092=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99957595147274092==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Insert set_current_state() before schedule_timeout(). Without the
insertion, schedule_timeout() returns immediately, resulting in an effective
busy-wait.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/isa/wavefront/wavefront_synth.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/sound/isa/wavefront/wavefront_synth.c	2005-01-18 13:38:54.000000000 -0800
@@ -1751,6 +1751,7 @@ wavefront_should_cause_interrupt (snd_wa
 	outb (val,port);
 	spin_unlock_irq(&dev->irq_lock);
 	while (1) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		if ((timeout = schedule_timeout(timeout)) == 0)
 			return;
 		if (dev->irq_ok)

--===============99957595147274092==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99957595147274092==--
