From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:07:13 +0000
Subject: [Kernel-janitors] [PATCH] i2c-algo-pcf: replace schedule_timeout()
Message-Id: <20040722220713.GL2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76078290994958842=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76078290994958842==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
a few) places where I had to make a decision to set the state before the
call to

schedule_timeout();

This of course affected any decision to replace the code with msleep()
or not. Please inform if the other state from the one I used is desired.

Thanks,
Nish



Applys-to: 2.6.7

Description: Remove pcf_sleep() and replace invocations with msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/i2c/algos/i2c-algo-pcf.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/i2c/algos/i2c-algo-pcf.c	2004-07-02 17:48:33.000000000 +0000
@@ -101,12 +101,6 @@ static int wait_for_bb(struct i2c_algo_p
 }
 
 
-static inline void pcf_sleep(unsigned long timeout)
-{
-	schedule_timeout( timeout * HZ);
-}
-
-
 static int wait_for_pin(struct i2c_algo_pcf_data *adap, int *status) {
 
 	int timeout = DEF_TIMEOUT;

--===============76078290994958842==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76078290994958842==--
