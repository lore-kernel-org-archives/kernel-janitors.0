From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 24 Mar 2005 16:23:14 +0000
Subject: [KJ] [PATCH] printk :
Message-Id: <20050324162314.GD1855@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vJguvTgX93MxBIIe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050323135158.GG9206@rhum.iomeda.fr>
In-Reply-To: <20050323135158.GG9206@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_epia.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/epia.c b/drivers/block/paride/epia.c
--- a/drivers/block/paride/epia.c	2005-03-18 02:34:09.000000000 +0100
+++ b/drivers/block/paride/epia.c	2005-03-22 16:41:21.000000000 +0100
@@ -263,7 +263,7 @@ static int epia_test_proto( PIA *pi, cha
         epia_disconnect(pi);
 
         if (verbose)  {
-            printk("%s: epia: port 0x%x, mode %d, test=(%d,%d,%d)\n",
+            printk(KERN_DEBUG "%s: epia: port 0x%x, mode %d, test=(%d,%d,%d)\n",
                    pi->device,pi->port,pi->mode,e[0],e[1],f);
         }
         
@@ -277,7 +277,7 @@ static void epia_log_adapter( PIA *pi, c
 {       char    *mode_string[6] = {"4-bit","5/3","8-bit",
 				   "EPP-8","EPP-16","EPP-32"};
 
-        printk("%s: epia %s, Shuttle EPIA at 0x%x, ",
+        printk(KERN_INFO "%s: epia %s, Shuttle EPIA at 0x%x, ",
                 pi->device,EPIA_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--vJguvTgX93MxBIIe
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vJguvTgX93MxBIIe--
