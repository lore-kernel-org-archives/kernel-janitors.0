From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:58:21 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] wireless/orinoco_plx:
Message-Id: <20040901225821.GK2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98990620866981216=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============98990620866981216==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/net/wireless/orinoco_plx.c	2004-08-31 21:32:27.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/net/wireless/orinoco_plx.c	2004-09-01 21:36:50.000000000 +0000
@@ -352,8 +352,7 @@ static int __init orinoco_plx_init(void)
 static void __exit orinoco_plx_exit(void)
 {
 	pci_unregister_driver(&orinoco_plx_driver);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	msleep(1000);
 }
 
 module_init(orinoco_plx_init);

--===============98990620866981216==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98990620866981216==--
