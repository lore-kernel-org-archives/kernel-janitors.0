From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:26:45 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/friq.c
Message-Id: <20050325132645.GL14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PHCdUe6m4AxPMzOu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_friq.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/friq.c b/drivers/block/paride/friq.c
--- a/drivers/block/paride/friq.c	2005-03-18 02:34:28.000000000 +0100
+++ b/drivers/block/paride/friq.c	2005-03-22 16:42:39.000000000 +0100
@@ -208,7 +208,7 @@ static int friq_test_proto( PIA *pi, cha
 	friq_disconnect(pi);
 
         if (verbose)  {
-            printk("%s: friq: port 0x%x, mode %d, test=(%d,%d,%d)\n",
+            printk(KERN_DEBUG "%s: friq: port 0x%x, mode %d, test=(%d,%d,%d)\n",
                    pi->device,pi->port,pi->mode,e[0],e[1],r);
         }
 
@@ -221,7 +221,7 @@ static void friq_log_adapter( PIA *pi, c
 {       char    *mode_string[6] = {"4-bit","8-bit",
 				   "EPP-8","EPP-16","EPP-32"};
 
-        printk("%s: friq %s, Freecom IQ ASIC-2 adapter at 0x%x, ", pi->device,
+        printk(KERN_INFO "%s: friq %s, Freecom IQ ASIC-2 adapter at 0x%x, ", pi->device,
 		FRIQ_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--PHCdUe6m4AxPMzOu--
