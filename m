From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:10:19 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/38] net/de2104x: replace
Message-Id: <20040922231019.GH1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60937387920380459=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60937387920380459==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/tulip/de2104x.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/tulip/de2104x.c	2004-09-15 09:38:42.000000000 -0700
@@ -1208,8 +1208,7 @@ static void de_adapter_wake (struct de_p
 		pci_write_config_dword(de->pdev, PCIPM, pmctl);
 
 		/* de4x5.c delays, so we do too */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep(10);
 	}
 }
 

--===============60937387920380459==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60937387920380459==--
