From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:28:37 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/frpw.c
Message-Id: <20050325132837.GM14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Bqc0IY4JZZt50bUr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_frpw.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/frpw.c b/drivers/block/paride/frpw.c
--- a/drivers/block/paride/frpw.c	2005-03-18 02:34:58.000000000 +0100
+++ b/drivers/block/paride/frpw.c	2005-03-22 16:44:13.000000000 +0100
@@ -231,14 +231,14 @@ static int frpw_test_proto( PIA *pi, cha
 
 	if (((pi->private%2) == 0) && (pi->mode > 2)) {
 	   if (verbose) 
-		printk("%s: frpw: Xilinx does not support mode %d\n",
+		printk(KERN_DEBUG "%s: frpw: Xilinx does not support mode %d\n",
 			pi->device, pi->mode);
 	   return 1;
 	}
 
 	if (((pi->private%2) == 1) && (pi->mode == 2)) {
 	   if (verbose)
-		printk("%s: frpw: ASIC does not support mode 2\n",
+		printk(KERN_DEBUG "%s: frpw: ASIC does not support mode 2\n",
 			pi->device);
 	   return 1;
 	}
@@ -261,7 +261,7 @@ static int frpw_test_proto( PIA *pi, cha
 	frpw_disconnect(pi);
 
         if (verbose)  {
-            printk("%s: frpw: port 0x%x, chip %ld, mode %d, test=(%d,%d,%d)\n",
+            printk(KERN_DEBUG "%s: frpw: port 0x%x, chip %ld, mode %d, test=(%d,%d,%d)\n",
                    pi->device,pi->port,(pi->private%2),pi->mode,e[0],e[1],r);
         }
 
@@ -274,7 +274,7 @@ static void frpw_log_adapter( PIA *pi, c
 {       char    *mode_string[6] = {"4-bit","8-bit","EPP",
 				   "EPP-8","EPP-16","EPP-32"};
 
-        printk("%s: frpw %s, Freecom (%s) adapter at 0x%x, ", pi->device,
+        printk(KERN_INFO "%s: frpw %s, Freecom (%s) adapter at 0x%x, ", pi->device,
 		FRPW_VERSION,((pi->private%2) == 0)?"Xilinx":"ASIC",pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Bqc0IY4JZZt50bUr--
