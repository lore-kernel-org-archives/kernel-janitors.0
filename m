From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:41:36 +0000
Subject: [Kernel-janitors] [PATCH] dvb/skystar2: replace schedule_timeout()
Message-Id: <20040726174136.GD1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60086342054520725=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60086342054520725==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/b2c2/skystar2.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/media/dvb/b2c2/skystar2.c	2004-07-02 18:39:56.000000000 +0000
@@ -2122,7 +2122,7 @@ static int send_diseqc_msg(struct adapte
 			udelay(12500);
 			set_tuner_tone(adapter, 0);
 		}
-		dvb_delay(20);
+		msleep(20);
 	}
 
 	return 0;

--===============60086342054520725==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60086342054520725==--
