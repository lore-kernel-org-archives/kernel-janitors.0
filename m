From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:35:34 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/on26.c
Message-Id: <20050325133534.GQ14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="E6lVPAHcXg6biC3t"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_on26.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/on26.c b/drivers/block/paride/on26.c
--- a/drivers/block/paride/on26.c	2005-03-18 02:34:27.000000000 +0100
+++ b/drivers/block/paride/on26.c	2005-03-22 16:45:41.000000000 +0100
@@ -167,7 +167,7 @@ static int on26_test_port( PIA *pi)  /* 
             }
 
 	    if (i == RESET_WAIT) 
-		printk("on26: Device reset failed (%x,%x)\n",x,y);
+		printk(KERN_NOTICE "on26: Device reset failed (%x,%x)\n",x,y);
 
             w0(4); P1; w0(4); P1;
         }
@@ -280,7 +280,7 @@ static void on26_log_adapter( PIA *pi, c
 {       char    *mode_string[5] = {"4-bit","8-bit","EPP-8",
 				   "EPP-16","EPP-32"};
 
-        printk("%s: on26 %s, OnSpec 90c26 at 0x%x, ",
+        printk(KERN_INFO "%s: on26 %s, OnSpec 90c26 at 0x%x, ",
                 pi->device,ON26_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_on26.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/on26.c b/drivers/block/paride/on26.c
--- a/drivers/block/paride/on26.c	2005-03-18 02:34:27.000000000 +0100
+++ b/drivers/block/paride/on26.c	2005-03-22 16:45:41.000000000 +0100
@@ -167,7 +167,7 @@ static int on26_test_port( PIA *pi)  /* 
             }
 
 	    if (i == RESET_WAIT) 
-		printk("on26: Device reset failed (%x,%x)\n",x,y);
+		printk(KERN_NOTICE "on26: Device reset failed (%x,%x)\n",x,y);
 
             w0(4); P1; w0(4); P1;
         }
@@ -280,7 +280,7 @@ static void on26_log_adapter( PIA *pi, c
 {       char    *mode_string[5] = {"4-bit","8-bit","EPP-8",
 				   "EPP-16","EPP-32"};
 
-        printk("%s: on26 %s, OnSpec 90c26 at 0x%x, ",
+        printk(KERN_INFO "%s: on26 %s, OnSpec 90c26 at 0x%x, ",
                 pi->device,ON26_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--E6lVPAHcXg6biC3t--
