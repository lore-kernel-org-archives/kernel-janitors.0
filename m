From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:38:20 +0000
Subject: [Kernel-janitors] [PATCH] eicon/os_4bri: replace schedule_timeout()
Message-Id: <20040723173820.GD1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22576907824996351=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22576907824996351==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/mntfunc.c	2004-06-16 05:18:54.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/mntfunc.c	2004-07-02 18:04:34.000000000 +0000
@@ -340,7 +340,7 @@ void DIVA_EXIT_FUNCTION mntfunc_finit(vo
 	int i = 100;
 
 	while (diva_mnt_shutdown_xdi_adapters() && i--) {
-		diva_os_sleep(10);
+		msleep(10);
 	}
 
 	disconnect_didd();

--===============22576907824996351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22576907824996351==--
