From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:08 +0000
Subject: [KJ] [PATCH 07/20] Fix "nocast type" warnings
Message-Id: <200507102319.08658.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/atm/firestream.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/atm/firestream.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

Index: linux-git/drivers/atm/firestream.c
=================================--- linux-git.orig/drivers/atm/firestream.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/drivers/atm/firestream.c	2005-07-10 22:43:19.000000000 +0000
@@ -1374,7 +1374,8 @@
 	}
 }
 
-static void __devinit *aligned_kmalloc (int size, int flags, int alignment)
+static void __devinit *aligned_kmalloc (int size, unsigned int __nocast flags,
+					int alignment)
 {
 	void  *t;
 
@@ -1464,7 +1465,8 @@
    does. I've seen "receive abort: no buffers" and things started
    working again after that...  -- REW */
 
-static void top_off_fp (struct fs_dev *dev, struct freepool *fp, int gfp_flags)
+static void top_off_fp (struct fs_dev *dev, struct freepool *fp,
+			unsigned int __nocast gfp_flags)
 {
 	struct FS_BPENTRY *qe, *ne;
 	struct sk_buff *skb;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
