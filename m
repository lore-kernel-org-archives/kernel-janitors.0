From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:42:36 +0000
Subject: [Kernel-janitors] [PATCH] dvb/dvb_ca_en50221: replace
Message-Id: <20040726174236.GE1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22304272422451343=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22304272422451343==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/dvb-core/dvb_ca_en50221.c	2004-06-16 05:19:13.000000000 +0000
+++ linux-dev/drivers/media/dvb/dvb-core/dvb_ca_en50221.c	2004-07-02 18:40:15.000000000 +0000
@@ -277,7 +277,7 @@ static int dvb_ca_en50221_wait_if_status
                 }
 
                 /* wait for a bit */
-                dvb_delay(1);
+                msleep(1);
         }
 
         dprintk("%s failed timeout:%lu\n", __FUNCTION__, jiffies - start);
@@ -1233,7 +1233,7 @@ static ssize_t dvb_ca_en50221_io_write(s
 			}
                         if (status != -EAGAIN) goto exit;
 
-                        dvb_delay(1);
+                        msleep(1);
                 }
 	        if (!written) {
 		        status = -EIO;

--===============22304272422451343==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22304272422451343==--
