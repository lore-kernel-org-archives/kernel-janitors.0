From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 24 Mar 2005 16:22:11 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/epat.c
Message-Id: <20050324162211.GC1855@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vA66WO2vHvL/CRSR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_epat.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/epat.c b/drivers/block/paride/epat.c
--- a/drivers/block/paride/epat.c	2005-03-18 02:34:58.000000000 +0100
+++ b/drivers/block/paride/epat.c	2005-03-22 16:41:03.000000000 +0100
@@ -280,7 +280,7 @@ static int epat_test_proto( PIA *pi, cha
         epat_disconnect(pi);
 
         if (verbose)  {
-            printk("%s: epat: port 0x%x, mode %d, ccr %x, test=(%d,%d,%d)\n",
+            printk(KERN_DEBUG "%s: epat: port 0x%x, mode %d, ccr %x, test=(%d,%d,%d)\n",
 		   pi->device,pi->port,pi->mode,cc,e[0],e[1],f);
 	}
 	
@@ -298,7 +298,7 @@ static void epat_log_adapter( PIA *pi, c
         ver = RR(0xb);
         epat_disconnect(pi);
 
-	printk("%s: epat %s, Shuttle EPAT chip %x at 0x%x, ",
+	printk(KERN_INFO "%s: epat %s, Shuttle EPAT chip %x at 0x%x, ",
 		pi->device,EPAT_VERSION,ver,pi->port);
 	printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vA66WO2vHvL/CRSR--
