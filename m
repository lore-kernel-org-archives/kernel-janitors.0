From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:51:23 +0000
Subject: [Kernel-janitors] [PATCH] net/appletalk: replace schedule_timeout()
Message-Id: <20040726235123.GG1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022884095467853083=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============022884095467853083==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/appletalk/ltpc.c	2004-06-16 05:19:03.000000000 +0000
+++ linux-dev/drivers/net/appletalk/ltpc.c	2004-07-02 22:11:54.000000000 +0000
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
+	msleep(1000);
 	
 	/* now, figure out which dma channel we're using, unless it's
 	   already been specified */

--===============022884095467853083==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022884095467853083==--
