From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 16:50:49 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 13/33] char/ipmi_si_intf: add
Message-Id: <20040916165049.GF1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65724424370486778=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65724424370486778==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Add set_current_state() before schedule_timeout() so a
delay is achieved. Without the addition, schedule_timeout() returns
immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/ipmi/ipmi_si_intf.c	2004-09-09 23:05:39.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/ipmi/ipmi_si_intf.c	2004-09-10 10:59:43.000000000 -0700
@@ -2287,6 +2287,7 @@ void __exit cleanup_one_si(struct smi_in
 	   interface is in a clean state. */
 	while ((to_clean->curr_msg) || (to_clean->si_state != SI_NORMAL)) {
 		poll(to_clean);
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 

--===============65724424370486778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65724424370486778==--
