From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:15:30 +0000
Subject: [KJ] [PATCH 47/53] sstfb: Clean up printk()'s in
Message-Id: <20050125231530.10418.29069.24624@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71615831718418255=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71615831718418255==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/sstfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/sstfb.c linux-2.6.11-rc2-mm1/drivers/video/sstfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/sstfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/sstfb.c	2005-01-24 19:07:04.148256995 -0500
@@ -790,7 +790,7 @@
 			return -EFAULT;
 		if (val > info->fix.smem_len)
 			val = info->fix.smem_len;
-		printk("filling %#x \n", val);
+		printk(KERN_DEBUG "filling %#x \n", val);
 		for (p=0 ; p<val; p+=2)
 			writew(p >> 6, info->screen_base + p);
 		return 0;

--===============71615831718418255==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71615831718418255==--
