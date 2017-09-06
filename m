From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Sep 2017 08:38:04 +0000
Subject: [bug report] drivers: w1: refactor w1_slave_show to make the temp reading functionality separate
Message-Id: <20170906083804.ftrbpqjfe72h2b2w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jaghathiswari Rankappagounder Natarajan,

The patch b78165f02871: "drivers: w1: refactor w1_slave_show to make
the temp reading functionality separate" from Aug 30, 2017, leads to
the following static checker warning:

	drivers/w1/slaves/w1_therm.c:573 read_therm()
	error: double unlock 'mutex:&dev->bus_mutex'

drivers/w1/slaves/w1_therm.c
   527                          w1_write_8(dev, W1_CONVERT_TEMP);
   528  
   529                          if (external_power) {
   530                                  mutex_unlock(&dev->bus_mutex);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   531  
   532                                  sleep_rem = msleep_interruptible(tm);
   533                                  if (sleep_rem != 0) {
   534                                          ret = -EINTR;
   535                                          goto dec_refcnt;
                                                ^^^^^^^^^^^^^^^
We're unlocked here.

   536                                  }
   537  
   538                                  ret = mutex_lock_interruptible(&dev->bus_mutex);
   539                                  if (ret != 0)
   540                                          goto dec_refcnt;
   541                          } else if (!w1_strong_pullup) {
   542                                  sleep_rem = msleep_interruptible(tm);
   543                                  if (sleep_rem != 0) {
   544                                          ret = -EINTR;
   545                                          goto dec_refcnt;
   546                                  }
   547                          }

   569  
   570  dec_refcnt:
   571          atomic_dec(THERM_REFCNT(family_data));
   572  mt_unlock:
   573          mutex_unlock(&dev->bus_mutex);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Double unlock.  It used to unlock first then do the atomic_dec().  I
didn't read the commit carefully enough to understand why this changed.

   574  error:
   575          return ret;
   576  }


regards,
dan carpenter
