From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:46:13 +0000
Subject: [Kernel-janitors] [PATCH] dvb/dst: replace schedule_timeout() with
Message-Id: <20040726174613.GK1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39947038832162374=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39947038832162374==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/dst.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/dst.c	2004-07-02 18:43:16.000000000 +0000
@@ -197,7 +197,7 @@ int retval;
 	retval = dst_gpio_outb(dst, DST_8820, DST_8820, 0);
 	if (retval < 0)
 		return retval;
-	dvb_delay(10);
+	msleep(10);
 	retval = dst_gpio_outb(dst, DST_8820, DST_8820, DST_8820);
 	if (retval < 0)
 		return retval;
@@ -220,7 +220,7 @@ int retval;
 	if (retval < 0)
 		return retval;
 	// dprintk ("%s: i2c enable delay\n", __FUNCTION__);
-	dvb_delay(33);
+	msleep(33);
 	return 0;
 }
 
@@ -234,7 +234,7 @@ int retval;
 	if (retval < 0)
 		return retval;
 	// dprintk ("%s: i2c disable delay\n", __FUNCTION__);
-	dvb_delay(33);
+	msleep(33);
 	return 0;
 }
 
@@ -252,7 +252,7 @@ int i;
 			dprintk ("%s: dst wait ready after %d\n", __FUNCTION__, i);
 			return 1;
 		}
-		dvb_delay(5);
+		msleep(5);
 	}
 	dprintk ("%s: dst wait NOT ready after %d\n", __FUNCTION__, i);
 	return 0;
@@ -275,14 +275,14 @@ static int write_dst (struct dst_data *d
 		}
 		dprintk("\n");
 	}
-	dvb_delay(30);
+	msleep(30);
 	for (cnt = 0; cnt < 4; cnt++) {
 		if ((err = dst->i2c->xfer (dst->i2c, &msg, 1)) < 0) {
 			dprintk ("%s: write_dst error (err == %i, len == 0x%02x, b0 == 0x%02x)\n", __FUNCTION__, err, len, data[0]);
 			dst_i2c_disable(dst);
-			dvb_delay(500);
+			msleep(500);
 			dst_i2c_enable(dst);
-			dvb_delay(500);
+			msleep(500);
 			continue;
 		} else
 			break;
@@ -564,7 +564,7 @@ static int dst_check_ci (struct dst_data
 		dprintk("%s: write not successful, maybe no card?\n", __FUNCTION__);
 		return retval;
 	}
-	dvb_delay(3);
+	msleep(3);
 	retval = read_dst (dst, rxbuf, 1);
 	dst_i2c_disable(dst);
 	if (retval < 0) {
@@ -648,7 +648,7 @@ static int dst_command (struct dst_data 
 		dprintk("%s: write not successful\n", __FUNCTION__);
 		return retval;
 	}
-	dvb_delay(33);
+	msleep(33);
 	retval = read_dst (dst, &reply, 1);
 	dst_i2c_disable(dst);
 	if (retval < 0) {
@@ -899,7 +899,7 @@ static int dst_write_tuna (struct dst_da
 		dprintk("%s: write not successful\n", __FUNCTION__);
 		return retval;
 	}
-	dvb_delay(3);
+	msleep(3);
 	retval = read_dst (dst, &reply, 1);
 	dst_i2c_disable(dst);
 	if (retval < 0) {

--===============39947038832162374==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39947038832162374==--
