From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:58:59 +0000
Subject: [Kernel-janitors] [PATCH] dvb/budget: replace schedule_timeout()
Message-Id: <20040726175859.GX1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62846108466871509=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62846108466871509==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/ttpci/budget.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/media/dvb/ttpci/budget.c	2004-07-02 20:29:12.000000000 +0000
@@ -100,7 +100,7 @@ static int SendDiSEqCMsg (struct budget 
 			udelay(12500);
 			saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
 		}
-		dvb_delay(20);
+		msleep(20);
 	}
 
 	return 0;

--===============62846108466871509==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62846108466871509==--
