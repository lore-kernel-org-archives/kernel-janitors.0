From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:21:59 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/fit2.c
Message-Id: <20050325132159.GJ14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3lcZGd9BuhuYXNfi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_fit2.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/fit2.c b/drivers/block/paride/fit2.c
--- a/drivers/block/paride/fit2.c	2005-03-18 02:34:18.000000000 +0100
+++ b/drivers/block/paride/fit2.c	2005-03-22 16:41:59.000000000 +0100
@@ -115,7 +115,7 @@ static void fit2_disconnect ( PIA *pi )
 
 static void fit2_log_adapter( PIA *pi, char * scratch, int verbose )
 
-{       printk("%s: fit2 %s, FIT 2000 adapter at 0x%x, delay %d\n",
+{	printk(KERN_INFO "%s: fit2 %s, FIT 2000 adapter at 0x%x, delay %d\n",
                 pi->device,FIT2_VERSION,pi->port,pi->delay);
 
 }

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--3lcZGd9BuhuYXNfi--
