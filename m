From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 17:46:40 +0000
Subject: [Kernel-janitors] Re: [PATCH] saa7146_i2c: replace
Message-Id: <20040728174640.GF1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63103019005347871=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41066A54.8080701@convergence.de>
In-Reply-To: <41066A54.8080701@convergence.de>
To: kernel-janitors@vger.kernel.org

--===============63103019005347871==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 09:10:52AM -0700, Nishanth Aravamudan wrote:

<snip>

> Here is this patch:
> 
> Applys-to: 2.6.7
> 
> Description: Uses msleep() instead of my_wait() to guarantee the time
> delay. Removes definition of my_wait().
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Sorry, this previous patch will not compile due to a typo. Find the
correct version below, thanks.


--- linux-vanilla/drivers/media/common/saa7146_i2c.c	2004-06-15 22:20:04.000000000 -0700
+++ linux-dev/drivers/media/common/saa7146_i2c.c	2004-07-28 10:42:41.000000000 -0700
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
 

--===============63103019005347871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63103019005347871==--
