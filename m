From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:36:41 +0000
Subject: [Kernel-janitors] [PATCH] eicon/capifunc: replace
Message-Id: <20040723173641.GA1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52789873967664369=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52789873967664369==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/capifunc.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/capifunc.c	2004-07-02 18:04:10.000000000 +0000
@@ -696,7 +696,7 @@ static int diva_add_card(DESCRIPTOR * d)
 	while (i++ < 30) {
 		if (a->automatic_law > 3)
 			break;
-		diva_os_sleep(10);
+		msleep(10);
 	}
 
 	/* profile information */
@@ -1170,7 +1170,7 @@ static void do_api_remove_start(void)
 		ret = api_remove_start();
 		diva_os_leave_spin_lock(&api_lock, &old_irql, "api remove start");
 
-		diva_os_sleep(10);
+		msleep(10);
 	} while (ret && count--);
 
 	if (ret)

--===============52789873967664369==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52789873967664369==--
