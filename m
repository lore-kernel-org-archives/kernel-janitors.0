From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:46:15 +0000
Subject: [Kernel-janitors] [PATCH] tulip/de2104x: replace schedule_timeout()
Message-Id: <20040727204615.GC3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78161248475895539=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78161248475895539==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/tulip/de2104x.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/net/tulip/de2104x.c	2004-07-03 01:48:34.000000000 +0000
@@ -1208,8 +1208,7 @@ static void de_adapter_wake (struct de_p
 		pci_write_config_dword(de->pdev, PCIPM, pmctl);
 
 		/* de4x5.c delays, so we do too */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep(10);
 	}
 }
 

--===============78161248475895539==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78161248475895539==--
