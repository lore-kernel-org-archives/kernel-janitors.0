From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:21:36 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/6] serial/icom: remove custom
Message-Id: <20040927212136.GD1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79670446357675373=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79670446357675373==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Remove custom msleep() to guarantee
the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/serial/icom.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/icom.c	2004-09-14 10:15:07.000000000 -0700
@@ -140,12 +140,6 @@ static inline void trace(struct icom_por
 static inline void trace(struct icom_port *icom_port, char *trace_pt, unsigned long trace_data) {};
 #endif
 
-static void msleep(unsigned long msecs)
-{
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(MSECS_TO_JIFFIES(msecs));
-}
-
 static void free_port_memory(struct icom_port *icom_port)
 {
 	struct pci_dev *dev = icom_port->adapter->pci_dev;

--===============79670446357675373==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79670446357675373==--
