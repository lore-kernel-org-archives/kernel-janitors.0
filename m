From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:58:44 +0000
Subject: [Kernel-janitors] [PATCH] wireless/orinoco_tmd: replace
Message-Id: <20040727205844.GJ3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56037450496082353=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727205644.GH3471@us.ibm.com>
In-Reply-To: <20040727205644.GH3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============56037450496082353==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wireless/orinoco_tmd.c	2004-06-16 05:18:59.000000000 +0000
+++ linux-dev/drivers/net/wireless/orinoco_tmd.c	2004-07-03 02:40:42.000000000 +0000
@@ -222,8 +222,7 @@ static int __init orinoco_tmd_init(void)
 extern void __exit orinoco_tmd_exit(void)
 {
 	pci_unregister_driver(&orinoco_tmd_driver);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	msleep(1000);
 }
 
 module_init(orinoco_tmd_init);

--===============56037450496082353==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56037450496082353==--
