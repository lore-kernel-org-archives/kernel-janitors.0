From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:40:14 +0000
Subject: [PATCH 1/7] ocfs2: Deletion of unnecessary checks before three function calls
Message-Id: <54E8DF1E.3060900@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <54E8DDDB.9020902@users.sourceforge.net>
In-Reply-To: <54E8DDDB.9020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 17:40:57 +0100

The functions kfree(), ocfs2_free_path() and __ocfs2_free_slot_info() test
whether their argument is NULL and then return immediately.
Thus the test around their calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c      | 17 +++++------------
 fs/ocfs2/slot_map.c   |  2 +-
 fs/ocfs2/stack_user.c |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index 044158b..fdab27c 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -3453,8 +3453,7 @@ static int ocfs2_merge_rec_right(struct ocfs2_path *left_path,
 					   subtree_index);
 	}
 out:
-	if (right_path)
-		ocfs2_free_path(right_path);
+	ocfs2_free_path(right_path);
 	return ret;
 }
 
@@ -3647,8 +3646,7 @@ static int ocfs2_merge_rec_left(struct ocfs2_path *right_path,
 						   right_path, subtree_index);
 	}
 out:
-	if (left_path)
-		ocfs2_free_path(left_path);
+	ocfs2_free_path(left_path);
 	return ret;
 }
 
@@ -4431,11 +4429,8 @@ ocfs2_figure_merge_contig_type(struct ocfs2_extent_tree *et,
 	}
 
 out:
-	if (left_path)
-		ocfs2_free_path(left_path);
-	if (right_path)
-		ocfs2_free_path(right_path);
-
+	ocfs2_free_path(left_path);
+	ocfs2_free_path(right_path);
 	return ret;
 }
 
@@ -6996,9 +6991,7 @@ out_commit:
 out:
 	if (data_ac)
 		ocfs2_free_alloc_context(data_ac);
-	if (pages)
-		kfree(pages);
-
+	kfree(pages);
 	return ret;
 }
 
diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index d5493e3..c5e530a 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -452,7 +452,7 @@ int ocfs2_init_slot_info(struct ocfs2_super *osb)
 
 	osb->slot_info = (struct ocfs2_slot_info *)si;
 bail:
-	if (status < 0 && si)
+	if (status < 0)
 		__ocfs2_free_slot_info(si);
 
 	return status;
diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
index 720aa38..c3b7807 100644
--- a/fs/ocfs2/stack_user.c
+++ b/fs/ocfs2/stack_user.c
@@ -1063,7 +1063,7 @@ static int user_cluster_connect(struct ocfs2_cluster_connection *conn)
 	}
 
 out:
-	if (rc && lc)
+	if (rc)
 		kfree(lc);
 	return rc;
 }
-- 
2.3.0

