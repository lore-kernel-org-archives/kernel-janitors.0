From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:55:39 +0000
Subject: [Kernel-janitors] [PATCH] dvb/av7110_v4l: replace
Message-Id: <20040726175539.GT1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12855249638745159=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12855249638745159==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/ttpci/av7110_v4l.c	2004-06-16 05:19:35.000000000 +0000
+++ linux-dev/drivers/media/dvb/ttpci/av7110_v4l.c	2004-07-02 20:25:40.000000000 +0000
@@ -517,7 +517,7 @@ int av7110_init_analog_module(struct av7
 	printk("av7110(%d): DVB-C analog module detected, initializing MSP3400\n",
 		av7110->dvb_adapter->num);
 	av7110->adac_type = DVB_ADAC_MSP;
-	dvb_delay(100); // the probing above resets the msp...
+	msleep(100);
 	msp_readreg(av7110, MSP_RD_DSP, 0x001e, &version1);
 	msp_readreg(av7110, MSP_RD_DSP, 0x001f, &version2);
 	printk("av7110(%d): MSP3400 version 0x%04x 0x%04x\n",

--===============12855249638745159==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12855249638745159==--
