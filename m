From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:54:27 +0000
Subject: [Kernel-janitors] [PATCH] dvb/ves1820: replace schedule_timeout()
Message-Id: <20040726175427.GQ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40669464178096271=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40669464178096271==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/ves1820.c	2004-06-15 22:19:23.000000000 -0700
+++ linux-dev/drivers/media/dvb/frontends/ves1820.c	2004-07-02 11:45:50.000000000 -0700
@@ -143,7 +143,7 @@ static int ves1820_writereg (struct dvb_
 			"(reg == 0x%02x, val == 0x%02x, ret == %i)\n",
 			fe->i2c->adapter->num, __FUNCTION__, reg, data, ret);
 
-	dvb_delay(10);
+	msleep(10);
 	return (ret != 1) ? -EREMOTEIO : 0;
 }
 

--===============40669464178096271==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40669464178096271==--
