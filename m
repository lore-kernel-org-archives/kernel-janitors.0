From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 22:56:40 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/2] i2c/i2c-algo-ite: remove
Message-Id: <20040916225640.GC1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13954369213669526=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13954369213669526==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Removes unused iic_sleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/i2c/algos/i2c-algo-ite.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/i2c/algos/i2c-algo-ite.c	2004-09-14 09:45:51.000000000 -0700
@@ -107,14 +107,6 @@ static int wait_for_bb(struct i2c_algo_i
 	return(timeout<=0);
 }
 
-/*
- * Puts this process to sleep for a period equal to timeout 
- */
-static inline void iic_sleep(unsigned long timeout)
-{
-	schedule_timeout( timeout * HZ);
-}
-
 /* After we issue a transaction on the IIC bus, this function
  * is called.  It puts this process to sleep until we get an interrupt from
  * from the controller telling us that the transaction we requested in complete.

--===============13954369213669526==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13954369213669526==--
