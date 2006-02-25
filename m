From: walter harms <wharms@bfs.de>
Date: Sat, 25 Feb 2006 12:32:37 +0000
Subject: [KJ] linux-2.6.15.4/drivers/i2c/busses/i2c-piix4.c: EPERM->EACCES
Message-Id: <44004E65.8030706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,
it was noticed that some driver return EPERM.
EPERM indicates no enought privilege to access a function.
This will fixit an return (i hope) a 'better' error msg.

re,
  walter

Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.15.4/drivers/i2c/busses/i2c-piix4.c.bak	2006-02-25 
13:18:48.000000000 +0100
+++ linux-2.6.15.4/drivers/i2c/busses/i2c-piix4.c	2006-02-25 
13:21:58.000000000 +0100
@@ -140,7 +140,7 @@
  		dev_err(&PIIX4_dev->dev, "IBM Laptop detected; this module "
  			"may corrupt your serial eeprom! Refusing to load "
  			"module!\n");
-		return -EPERM;
+		return -EACCES;
  	}

  	/* Determine the address of the SMBus areas */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
