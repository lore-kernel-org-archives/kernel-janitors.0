From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:54:02 +0000
Subject: [Kernel-janitors] [PATCH] pci: replace schedule_timeout() with
Message-Id: <20040727215402.GW3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99127467777382194=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99127467777382194==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pci/pci.c	2004-06-16 05:19:03.000000000 +0000
+++ linux-dev/drivers/pci/pci.c	2004-07-03 02:45:16.000000000 +0000
@@ -291,10 +291,7 @@ pci_set_power_state(struct pci_dev *dev,
 	/* Mandatory power management transition delays */
 	/* see PCI PM 1.1 5.6.1 table 18 */
 	if(state == 3 || dev->current_state == 3)
-	{
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
-	}
+		msleep(10);
 	else if(state == 2 || dev->current_state == 2)
 		udelay(200);
 	dev->current_state = state;

--===============99127467777382194==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99127467777382194==--
