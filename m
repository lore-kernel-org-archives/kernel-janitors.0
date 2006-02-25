From: walter harms <wharms@bfs.de>
Date: Sat, 25 Feb 2006 12:30:16 +0000
Subject: [KJ] linux-2.6.15.4/drivers/i2c/i2c-core.c.bak:  EPERM -> EINVAL
Message-Id: <44004DD8.2040606@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,
it was noticed that some driver return EPERM instead of EINVAL.
EPERM indicates no enought privilege to access a function.
This will fixit an return (i hope) a 'better' error msg.

re,
  walter


Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.15.4/drivers/i2c/i2c-core.c.bak	2006-02-25 
13:25:48.000000000 +0100
+++ linux-2.6.15.4/drivers/i2c/i2c-core.c	2006-02-25 13:24:44.000000000 
+0100
@@ -522,7 +522,7 @@
  		else {
  			pr_debug("i2c-core: %s used one too many times\n",
  				__FUNCTION__);
-			return -EPERM;
+			return -EINVAL;
  		}
  	}
  	
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
