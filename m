From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 13:52:49 +0000
Subject: [PATCH v2] btrfs: Use common error handling code in update_ref_path()
Message-Id: <1625753e-5334-3774-72e6-685d5629c635@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e8e1da2-a9e3-9dc7-6ffe-6c32f8464337@users.sourceforge.net>
 <7083c299-4803-68c8-ae57-c0e74f5d9229@users.sourceforge.net>
 <dcd64dfb-944a-2a81-b4a2-8d7ce71d811b@suse.com>
 <20170821134215.4wpttdh5siuax5b3@mwanda>
In-Reply-To: <20170821134215.4wpttdh5siuax5b3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-btrfs@vger.kernel.org, Chris Mason <clm@fb.com>, Dan Carpenter <dan.carpenter@oracle.com>, David Sterba <dsterba@suse.com>, Jeff Mahoney <jeffm@suse.com>, Josef Bacik <jbacik@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 15:45:23 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Do you find this refactoring acceptable instead?

 fs/btrfs/send.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index 59fb1ed6ca20..527a9a735664 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -3697,20 +3697,20 @@ static int update_ref_path(struct send_ctx *sctx, struct recorded_ref *ref)
 		return -ENOMEM;
 
 	ret = get_cur_path(sctx, ref->dir, ref->dir_gen, new_path);
-	if (ret < 0) {
-		fs_path_free(new_path);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_path;
+
 	ret = fs_path_add(new_path, ref->name, ref->name_len);
-	if (ret < 0) {
-		fs_path_free(new_path);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_path;
 
 	fs_path_free(ref->full_path);
 	set_ref_path(ref, new_path);
 
 	return 0;
+free_path:
+	fs_path_free(new_path);
+	return ret;
 }
 
 /*
-- 
2.14.0

