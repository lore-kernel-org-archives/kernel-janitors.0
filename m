From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 22:09:36 +0000
Subject: [Kernel-janitors] [PATCH] saa7146_i2c: replace schedule_timeout()
Message-Id: <20040723220936.GQ2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35166623985212464=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35166623985212464==
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

Description: Replace my_wait() with msleep() and remove defintion of
my_wait().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/common/saa7146_i2c.c	2004-06-15 22:20:04.000000000 -0700
+++ linux-dev/drivers/media/common/saa7146_i2c.c	2004-07-23 15:07:45.000000000 -0700
@@ -1,13 +1,6 @@
 #include <linux/version.h>
 #include <media/saa7146_vv.h>
 
-/* helper function */
-static void my_wait(struct saa7146_dev *dev, long ms)
-{
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((((ms+10)/10)*HZ)/1000);
-}
-
 u32 saa7146_i2c_func(struct i2c_adapter *adapter)
 {
 //fm	DEB_I2C(("'%s'.\n", adapter->name));
@@ -136,12 +129,12 @@ static int saa7146_i2c_reset(struct saa7
 		/* set "ABORT-OPERATION"-bit (bit 7)*/
 		saa7146_write(dev, I2C_STATUS, (dev->i2c_bitrate | MASK_07));
 		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
-		my_wait(dev,SAA7146_I2C_DELAY);
+		msleep(SAA7146_I2C_DELAY);
 
 		/* clear all error-bits pending; this is needed because p.123, note 1 */
 		saa7146_write(dev, I2C_STATUS, dev->i2c_bitrate);
 		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
-		my_wait(dev,SAA7146_I2C_DELAY);
+		msleep(SAA7146_I2C_DELAY);
  	}
 
 	/* check if any error is (still) present. (this can be necessary because p.123, note 1) */
@@ -155,18 +148,18 @@ static int saa7146_i2c_reset(struct saa7
 		   after serious protocol errors caused by e.g. the SAA7740 */
 		saa7146_write(dev, I2C_STATUS, (dev->i2c_bitrate | MASK_07));
 		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
-		my_wait(dev,SAA7146_I2C_DELAY);
+		msleep(SAA7146_I2C_DELAY);
 
 		/* clear all error-bits pending */
 		saa7146_write(dev, I2C_STATUS, dev->i2c_bitrate);
 		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
-		my_wait(dev,SAA7146_I2C_DELAY);
+		msleep(SAA7146_I2C_DELAY);
 
 		/* the data sheet says it might be necessary to clear the status
 		   twice after an abort */
 		saa7146_write(dev, I2C_STATUS, dev->i2c_bitrate);
 		saa7146_write(dev, MC2, (MASK_00 | MASK_16));
-		my_wait(dev,SAA7146_I2C_DELAY);
+		msleep(SAA7146_I2C_DELAY);
      	}
 
 	/* if any error is still present, a fatal error has occured ... */
@@ -243,7 +236,7 @@ static int saa7146_i2c_writeout(struct s
 			if ((++trial < 20) && short_delay)
 				udelay(10);
 			else
-			my_wait(dev,1);
+			msleep(1);
 		}
 	}
 
@@ -345,7 +338,7 @@ int saa7146_i2c_transfer(struct saa7146_
 		}
 	        
 	        /* delay a bit before retrying */
-	        my_wait(dev, 10);
+	        msleep(10);
 		
 	} while (err != num && retries--);
 

--===============35166623985212464==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35166623985212464==--
