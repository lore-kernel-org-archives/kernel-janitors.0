From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:47:57 +0000
Subject: [Kernel-janitors] [PATCH] dvb/tda1004x.c: replace
Message-Id: <20040726174757.GO1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64073640655268393=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64073640655268393==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/tda1004x.c	2004-06-16 05:18:38.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/tda1004x.c	2004-07-21 17:12:09.000000000 +0000
@@ -44,6 +44,7 @@
 #include <linux/fcntl.h>
 #include <linux/errno.h>
 #include <linux/syscalls.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -280,7 +281,7 @@ static int tda1004x_enable_tuner_i2c(str
 	dprintk("%s\n", __FUNCTION__);
 
 	result = tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 2, 2);
-	dvb_delay(1);
+	msleep(1);
 	return result;
 }
 
@@ -453,7 +454,7 @@ static int tda1004x_fwupload(struct dvb_
 		tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 0x10, 0);
                 tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 8, 8);
                 tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 8, 0);
-                dvb_delay(10);
+                msleep(10);
 
                 // set parameters
                 tda10045h_set_bandwidth(i2c, tda_state, BANDWIDTH_8_MHZ);
@@ -463,7 +464,7 @@ static int tda1004x_fwupload(struct dvb_
                 // reset chip
 		tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 1, 0);
                 tda1004x_write_mask(i2c, tda_state, TDA10046H_CONF_TRISTATE1, 1, 0);
-                dvb_delay(10);
+                msleep(10);
 
                 // set parameters
                 tda1004x_write_byte(i2c, tda_state, TDA10046H_CONFPLL2, 10);
@@ -506,7 +507,7 @@ static int tda1004x_fwupload(struct dvb_
         switch(tda_state->fe_type) {
         case FE_TYPE_TDA10045H:
                 // DSPREADY doesn't seem to work on the TDA10045H
-                dvb_delay(100);
+                msleep(100);
                 break;
 
         case FE_TYPE_TDA10046H:
@@ -517,7 +518,7 @@ static int tda1004x_fwupload(struct dvb_
                                 return -EIO;
                         }
 
-                        dvb_delay(1);
+                        msleep(1);
                 }
                 break;
         }
@@ -807,7 +808,7 @@ static int tda1004x_set_frequency(struct
                 if (i2c->xfer(i2c, &tuner_msg, 1) != 1) {
 			return -EIO;
 		}
-		dvb_delay(1);
+		msleep(1);
 		tda1004x_disable_tuner_i2c(i2c, tda_state);
                 if (tda_state->fe_type == FE_TYPE_TDA10046H)
                         tda1004x_write_mask(i2c, tda_state, TDA10046H_AGC_CONF, 4, 4);
@@ -994,12 +995,12 @@ static int tda1004x_set_fe(struct dvb_i2
         case FE_TYPE_TDA10045H:
 	tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 8, 8);
 	tda1004x_write_mask(i2c, tda_state, TDA1004X_CONFC4, 8, 0);
-	dvb_delay(10);
+	msleep(10);
                 break;
 
         case FE_TYPE_TDA10046H:
                 tda1004x_write_mask(i2c, tda_state, TDA1004X_AUTO, 0x40, 0x40);
-                dvb_delay(10);
+                msleep(10);
                 break;
         }
 
@@ -1435,7 +1436,7 @@ static int tda1004x_attach(struct dvb_i2
 	tuner_msg.buf = td1344_init;
 	tuner_msg.len = sizeof(td1344_init);
 	if (i2c->xfer(i2c, &tuner_msg, 1) == 1) {
-                dvb_delay(1);
+                msleep(1);
                         tuner_address = 0x61;
                         tuner_type = TUNER_TYPE_TD1344;
                         printk("tda1004x: Detected Philips TD1344 tuner.\n");
@@ -1448,7 +1449,7 @@ static int tda1004x_attach(struct dvb_i2
                 tuner_msg.buf = td1316_init;
                 tuner_msg.len = sizeof(td1316_init);
                 if (i2c->xfer(i2c, &tuner_msg, 1) == 1) {
-                        dvb_delay(1);
+                        msleep(1);
                         tuner_address = 0x63;
                         tuner_type = TUNER_TYPE_TD1316;
                         printk("tda1004x: Detected Philips TD1316 tuner.\n");
@@ -1461,8 +1462,8 @@ static int tda1004x_attach(struct dvb_i2
                 tuner_msg.buf = td1316_init_tda10046h;
                 tuner_msg.len = sizeof(td1316_init_tda10046h);
                 if (i2c->xfer(i2c, &tuner_msg, 1) == 1) {
-                        dvb_delay(1);
-                        tuner_address = 0x60;
+                        msleep(1);
+			tuner_address = 0x60;
                         tuner_type = TUNER_TYPE_TD1316;
                         printk("tda1004x: Detected Philips TD1316 tuner.\n");
 		}

--===============64073640655268393==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64073640655268393==--
