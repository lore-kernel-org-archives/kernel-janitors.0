From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:31:41 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] i2c-algo-ite: remove
Message-Id: <20040901223140.GE2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90389265440699829=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============90389265440699829==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Removes unused function iic_sleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-bk7-vanilla/drivers/i2c/algos/i2c-algo-ite.c	2004-08-31 21:32:25.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/i2c/algos/i2c-algo-ite.c	2004-09-01 22:10:04.000000000 +0000
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

--===============90389265440699829==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90389265440699829==--
