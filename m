From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:46:13 +0000
Subject: [PATCH 4/7] ocfs2: One function call less in ocfs2_merge_rec_left() after error detection
Message-Id: <54E8E085.2060907@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <54E8DDDB.9020902@users.sourceforge.net>
In-Reply-To: <54E8DDDB.9020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:16:33 +0100

The ocfs2_free_path() function was called by the ocfs2_merge_rec_left()
function even if a call of the ocfs2_get_left_path() function failed.

Return from this implementation directly after corresponding
exception handling.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index 370b4ea..4bdc19f 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -3535,7 +3535,7 @@ static int ocfs2_merge_rec_left(struct ocfs2_path *right_path,
 		ret = ocfs2_get_left_path(et, right_path, &left_path);
 		if (ret) {
 			mlog_errno(ret);
-			goto out;
+			return ret;
 		}
 
 		left_el = path_leaf_el(left_path);
-- 
2.3.0

