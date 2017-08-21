From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 12:41:43 +0000
Subject: [PATCH 4/5] btrfs: Use common error handling code in update_ref_path()
Message-Id: <7083c299-4803-68c8-ae57-c0e74f5d9229@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e8e1da2-a9e3-9dc7-6ffe-6c32f8464337@users.sourceforge.net>
In-Reply-To: <1e8e1da2-a9e3-9dc7-6ffe-6c32f8464337@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-btrfs@vger.kernel.org, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Josef Bacik <jbacik@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 13:34:29 +0200

Add a jump target so that a bit of exception handling can be better reused
in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/btrfs/send.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index 59fb1ed6ca20..a96edc91a101 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -3697,12 +3697,12 @@ static int update_ref_path(struct send_ctx *sctx, struct recorded_ref *ref)
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
 	if (ret < 0) {
+free_path:
 		fs_path_free(new_path);
 		return ret;
 	}
-- 
2.14.0

