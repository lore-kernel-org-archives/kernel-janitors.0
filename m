From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:21:08 +0000
Subject: [Kernel-janitors] [PATCH] wan/farsync: insert set_current_state()
Message-Id: <20040727232108.GS4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92979915044383554=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727232031.GR4679@us.ibm.com>
In-Reply-To: <20040727232031.GR4679@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============92979915044383554==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, wrong recipients . . .

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Insert set_current_state() so schedule_timeout()
functions as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wan/farsync.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/net/wan/farsync.c	2004-07-16 15:52:23.000000000 +0000
@@ -975,6 +975,7 @@ fst_issue_cmd(struct fst_port_info *port
 	/* Wait for any previous command to complete */
 	while (mbval > NAK) {
 		spin_unlock_irqrestore(&card->card_lock, flags);
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
 		spin_lock_irqsave(&card->card_lock, flags);
 

--===============92979915044383554==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92979915044383554==--
