From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:46:16 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 13/38] net/farsync: add
Message-Id: <20040922234616.GA4263@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31672711779469953=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31672711779469953==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Insert set_current_state() before schedule_timeout() so the
function delays as expected. Without the addition, schedule_timeout()
will return immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wan/farsync.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wan/farsync.c	2004-09-15 09:48:26.000000000 -0700
@@ -975,6 +975,7 @@ fst_issue_cmd(struct fst_port_info *port
 	/* Wait for any previous command to complete */
 	while (mbval > NAK) {
 		spin_unlock_irqrestore(&card->card_lock, flags);
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
 		spin_lock_irqsave(&card->card_lock, flags);
 

--===============31672711779469953==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31672711779469953==--
