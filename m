From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:34:21 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/on20.c
Message-Id: <20050325133421.GP14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="I/5syFLg1Ed7r+1G"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_on20.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/on20.c b/drivers/block/paride/on20.c
--- a/drivers/block/paride/on20.c	2005-03-18 02:34:28.000000000 +0100
+++ b/drivers/block/paride/on20.c	2005-03-22 16:44:54.000000000 +0100
@@ -115,7 +115,7 @@ static void on20_log_adapter( PIA *pi, c
 
 {       char    *mode_string[2] = {"4-bit","8-bit"};
 
-        printk("%s: on20 %s, OnSpec 90c20 at 0x%x, ",
+        printk(KERN_INFO "%s: on20 %s, OnSpec 90c20 at 0x%x, ",
                 pi->device,ON20_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--I/5syFLg1Ed7r+1G--
