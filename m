From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 01 Feb 2015 16:15:24 +0000
Subject: [PATCH] jfs: Deletion of an unnecessary check before the function call "unload_nls"
Message-Id: <54CE511C.3060908@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 1 Feb 2015 17:00:24 +0100

The unload_nls() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 16c3a95..5d30c56 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -619,8 +619,7 @@ out_mount_failed:
 	iput(sbi->direct_inode);
 	sbi->direct_inode = NULL;
 out_unload:
-	if (sbi->nls_tab)
-		unload_nls(sbi->nls_tab);
+	unload_nls(sbi->nls_tab);
 out_kfree:
 	kfree(sbi);
 	return ret;
-- 
2.2.2

