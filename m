From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:56:00 +0000
Subject: [Kernel-janitors] [PATCH] dvb/budget-av: replace schedule_timeout()
Message-Id: <20040726175600.GU1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60179096395793819=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60179096395793819==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/ttpci/budget-av.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/media/dvb/ttpci/budget-av.c	2004-07-02 20:28:43.000000000 +0000
@@ -177,7 +177,7 @@ static int budget_av_detach (struct saa7
 	if ( 1 == budget_av->has_saa7113 ) {
 	saa7146_setgpio(dev, 0, SAA7146_GPIO_OUTLO);
 
-	dvb_delay(200);
+	msleep(200);
 
 	saa7146_unregister_device (&budget_av->vd, dev);
 	}
@@ -225,7 +225,7 @@ static int budget_av_attach (struct saa7
 	//test_knc_ci(av7110);
 
 	saa7146_setgpio(dev, 0, SAA7146_GPIO_OUTHI);
-	dvb_delay(500);
+	msleep(500);
 
 	if ( 0 == saa7113_init(budget_av) ) {
 		budget_av->has_saa7113 = 1;

--===============60179096395793819==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60179096395793819==--
