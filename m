From: Daniele Venzano <venza@libero.it>
Date: Sun, 18 Jan 2004 15:26:08 +0000
Subject: [Kernel-janitors] [PATCH] comparison always false due to limited
Message-Id: <20040118152607.GB15165@picchio.gall.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Compiling 2.6.1 with -W as suggested somewhere in the TOSO list, i run
into this warning:

drivers/atm/horizon.c: In function `hrz_check_args':
drivers/atm/horizon.c:2905: warning: comparison is always false due to 
limited range of data type

the code affected was this:

if (max_rx_size > RX_AAL5_LIMIT)
      PRINTK (KERN_NOTICE, "max_rx_size has been limited to %hu",
	    max_rx_size = RX_AAL5_LIMIT);

I could remove the code or make max_rx_size an int (was a short). Since
removing code is usually not a good idea I made this patch:

--- linux-2.6.1/drivers/atm/horizon.c   2003-12-19 10:34:10.000000000 +0100
+++ linux-2.6.1-kj/drivers/atm/horizon.c        2004-01-18 16:08:16.000000000 +0100
@@ -360,7 +360,7 @@
 static unsigned short debug = 0;
 static unsigned short vpi_bits = 0;
 static unsigned short max_tx_size = 9000;
-static unsigned short max_rx_size = 9000;
+static unsigned int max_rx_size = 9000;
 static unsigned char pci_lat = 0;
 
 /********** access functions **********/



There is also a similar warning for smbfs:
fs/smbfs/inode.c: In function `smb_fill_super':
fs/smbfs/inode.c:554: warning: comparison is always false due to limited range of data type
fs/smbfs/inode.c:555: warning: comparison is always false due to limited range of data type
but the code is much more complex (three nested macros).

Finally I saw this that made me laugh and wanted to share with someone else:
drivers/char/applicom.c:522:2: warning: #warning "Je suis stupide. DW. - copy*user in cli"

Bye.
-- 
-----------------------------
Daniele Venzano
Web: http://teg.homeunix.org

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
