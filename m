From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:53:54 +0000
Subject: [Kernel-janitors] [PATCH] video/msp3400: replace schedule_timeout()
Message-Id: <20040726225354.GQ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89750100221154883=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89750100221154883==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/msp3400.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/media/video/msp3400.c	2004-07-12 18:53:53.000000000 +0000
@@ -190,8 +190,7 @@ msp3400c_read(struct i2c_client *client,
 		err++;
 		printk(KERN_WARNING "msp34xx: I/O error #%d (read 0x%02x/0x%02x)\n",
 		       err, dev, addr);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 	if (3 == err) {
 		printk(KERN_WARNING "msp34xx: giving up, reseting chip. Sound will go off, sorry folks :-|\n");
@@ -219,8 +218,7 @@ msp3400c_write(struct i2c_client *client
 		err++;
 		printk(KERN_WARNING "msp34xx: I/O error #%d (write 0x%02x/0x%02x)\n",
 		       err, dev, addr);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 	if (3 == err) {
 		printk(KERN_WARNING "msp34xx: giving up, reseting chip. Sound will go off, sorry folks :-|\n");

--===============89750100221154883==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89750100221154883==--
