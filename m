From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 11:47:40 +0000
Subject: [PATCH 1/2] ext4: Delete an error message for a failed memory allocation in ext4_multi_mount_protect
Message-Id: <5bf432ae-398d-718c-8105-3092a240a8ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca49a6dc-f2ee-d427-5f16-052706277b38@users.sourceforge.net>
In-Reply-To: <ca49a6dc-f2ee-d427-5f16-052706277b38@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 13:04:50 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ext4/mmp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index eb9835638680..1ce00453f612 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -371,7 +371,6 @@ int ext4_multi_mount_protect(struct super_block *sb,
-	if (!mmpd_data) {
-		ext4_warning(sb, "not enough memory for mmpd_data");
+	if (!mmpd_data)
 		goto failed;
-	}
+
 	mmpd_data->sb = sb;
 	mmpd_data->bh = bh;
 
-- 
2.14.0

