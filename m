From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:44:15 +0000
Subject: [PATCH 3/7] ocfs2: Less function calls in ocfs2_figure_merge_contig_type() after error detection
Message-Id: <54E8E00F.2030502@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <54E8DDDB.9020902@users.sourceforge.net>
In-Reply-To: <54E8DDDB.9020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 18:54:25 +0100

The ocfs2_free_path() function was called in some cases by the
ocfs2_figure_merge_contig_type() function during error handling
even if the passed variables "left_path" and "right_path" contained
still a null pointer.

Corresponding implementation details could be improved by adjustments for
jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index bf806e5..370b4ea 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -4332,17 +4332,17 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 	} else if (path->p_tree_depth > 0) {
 		status = ocfs2_find_cpos_for_left_leaf(sb, path, &left_cpos);
 		if (status)
-			goto out;
+			goto exit;
 
 		if (left_cpos != 0) {
 			left_path = ocfs2_new_path_from_path(path);
 			if (!left_path)
-				goto out;
+				goto exit;
 
 			status = ocfs2_find_path(et->et_ci, left_path,
 						 left_cpos);
 			if (status)
-				goto out;
+				goto free_left_path;
 
 			new_el = path_leaf_el(left_path);
 
@@ -4359,7 +4359,7 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 					    le16_to_cpu(new_el->l_next_free_rec),
 					    le16_to_cpu(new_el->l_count));
 				status = -EINVAL;
-				goto out;
+				goto free_left_path;
 			}
 			rec = &new_el->l_recs[
 				le16_to_cpu(new_el->l_next_free_rec) - 1];
@@ -4386,18 +4386,18 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 		 path->p_tree_depth > 0) {
 		status = ocfs2_find_cpos_for_right_leaf(sb, path, &right_cpos);
 		if (status)
-			goto out;
+			goto free_left_path;
 
 		if (right_cpos = 0)
-			goto out;
+			goto free_left_path;
 
 		right_path = ocfs2_new_path_from_path(path);
 		if (!right_path)
-			goto out;
+			goto free_left_path;
 
 		status = ocfs2_find_path(et->et_ci, right_path, right_cpos);
 		if (status)
-			goto out;
+			goto free_right_path;
 
 		new_el = path_leaf_el(right_path);
 		rec = &new_el->l_recs[0];
@@ -4411,7 +4411,7 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 					    (unsigned long long)le64_to_cpu(eb->h_blkno),
 					    le16_to_cpu(new_el->l_next_free_rec));
 				status = -EINVAL;
-				goto out;
+				goto free_right_path;
 			}
 			rec = &new_el->l_recs[1];
 		}
@@ -4428,9 +4428,11 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 			ret = contig_type;
 	}
 
-out:
-	ocfs2_free_path(left_path);
+free_right_path:
 	ocfs2_free_path(right_path);
+free_left_path:
+	ocfs2_free_path(left_path);
+exit:
 	return ret;
 }
 
-- 
2.3.0

