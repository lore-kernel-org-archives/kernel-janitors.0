From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:42:48 +0000
Subject: [PATCH 2/7] ocfs2: Less function calls in ocfs2_convert_inline_data_to_extents() after error detecti
Message-Id: <54E8DFB8.7030604@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <54E8DDDB.9020902@users.sourceforge.net>
In-Reply-To: <54E8DDDB.9020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 18:19:04 +0100

The kfree() function was called in a few cases by the
ocfs2_convert_inline_data_to_extents() function during error handling
even if the passed variable "pages" contained a null pointer.

* Return from this implementation directly after failure detection for
  the function call "kcalloc".

* Corresponding details could be improved by the introduction of another
  jump label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index fdab27c..bf806e5 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -6853,13 +6853,13 @@ int ocfs2_convert_inline_data_to_extents(struct inode *inode,
 		if (pages = NULL) {
 			ret = -ENOMEM;
 			mlog_errno(ret);
-			goto out;
+			return ret;
 		}
 
 		ret = ocfs2_reserve_clusters(osb, 1, &data_ac);
 		if (ret) {
 			mlog_errno(ret);
-			goto out;
+			goto free_pages;
 		}
 	}
 
@@ -6991,6 +6991,7 @@ out_commit:
 out:
 	if (data_ac)
 		ocfs2_free_alloc_context(data_ac);
+free_pages:
 	kfree(pages);
 	return ret;
 }
-- 
2.3.0

