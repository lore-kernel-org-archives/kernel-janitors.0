From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:36:36 +0000
Subject: [KJ] [PATCH 27/39] sound/gus_pcm: insert set_current_state() before
Message-Id: <20050121193636.GH3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92044816295990728=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92044816295990728==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Insert set_current_state() before schedule_timeout(). Without the
insertion, schedule_timeout() returns immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/isa/gus/gus_pcm.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/sound/isa/gus/gus_pcm.c	2005-01-18 13:27:24.000000000 -0800
@@ -333,6 +333,7 @@ static int snd_gf1_pcm_poke_block(snd_gu
 			}
 		}
 		if (count > 0 && !in_interrupt()) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(1);
 			if (signal_pending(current))
 				return -EAGAIN;

--===============92044816295990728==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92044816295990728==--
