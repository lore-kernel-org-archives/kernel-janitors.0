From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:23:46 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/fit3.c
Message-Id: <20050325132346.GK14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vEao7xgI/oilGqZ+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_fit3.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/fit3.c b/drivers/block/paride/fit3.c
--- a/drivers/block/paride/fit3.c	2005-03-18 02:34:27.000000000 +0100
+++ b/drivers/block/paride/fit3.c	2005-03-22 16:42:12.000000000 +0100
@@ -173,7 +173,7 @@ static void fit3_log_adapter( PIA *pi, c
 
 {       char    *mode_string[3] = {"4-bit","8-bit","EPP"};
 
-	printk("%s: fit3 %s, FIT 3000 adapter at 0x%x, "
+	printk(KERN_INFO "%s: fit3 %s, FIT 3000 adapter at 0x%x, "
 	       "mode %d (%s), delay %d\n",
                 pi->device,FIT3_VERSION,pi->port,
 		pi->mode,mode_string[pi->mode],pi->delay);

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vEao7xgI/oilGqZ+--
