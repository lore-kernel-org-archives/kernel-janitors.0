From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:29 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 22/38] net/ltpc: replace
Message-Id: <20040923221329.GG13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39570037144965253=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39570037144965253==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() / msleep() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/appletalk/ltpc.c	2004-09-13 17:15:44.000000000 -0700
+++ 2.6.9-rc2/drivers/net/appletalk/ltpc.c	2004-09-14 17:11:33.000000000 -0700
@@ -1109,8 +1109,7 @@ struct net_device * __init ltpc_probe(vo
 	inb_p(io+1);
 	inb_p(io+3);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(2*HZ/100);
+	msleep(20);
 
 	inb_p(io+0);
 	inb_p(io+2);
@@ -1120,8 +1119,7 @@ struct net_device * __init ltpc_probe(vo
 	inb_p(io+5); /* enable dma */
 	inb_p(io+6); /* tri-state interrupt line */
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 	
 	/* now, figure out which dma channel we're using, unless it's
 	   already been specified */

--===============39570037144965253==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39570037144965253==--
