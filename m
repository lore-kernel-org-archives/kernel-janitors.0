From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:00:52 +0000
Subject: [Kernel-janitors] [PATCH] serial/8250_pci: replace
Message-Id: <20040727230052.GF4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89773332825786178=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89773332825786178==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/serial/8250_pci.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/serial/8250_pci.c	2004-07-06 00:57:45.000000000 +0000
@@ -574,8 +574,7 @@ titan_400l_800l_setup(struct pci_dev *de
 
 static int __devinit pci_xircom_init(struct pci_dev *dev)
 {
-	__set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 	return 0;
 }
 

--===============89773332825786178==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89773332825786178==--
