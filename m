From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:58:28 +0000
Subject: [Kernel-janitors] Re: [PATCH] wireless/orinoco_plx: replace
Message-Id: <20040727205828.GI3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78109273049949635=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78109273049949635==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 01:56:44PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 

Sorry, wrong patch attached. Please find the correct one below.

-Nish

--- linux-vanilla/drivers/net/wireless/orinoco_plx.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/wireless/orinoco_plx.c	2004-07-03 02:40:32.000000000 +0000
@@ -344,8 +344,7 @@ static int __init orinoco_plx_init(void)
 extern void __exit orinoco_plx_exit(void)
 {
 	pci_unregister_driver(&orinoco_plx_driver);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	msleep(1000);
 }
 
 module_init(orinoco_plx_init);

--===============78109273049949635==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78109273049949635==--
