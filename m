From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 08:46:40 +0000
Subject: [patch v2] ext4: potential NULL dereference on error
Message-Id: <20120515084640.GB30265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120514222535.GW5353@quack.suse.cz>
In-Reply-To: <20120514222535.GW5353@quack.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

The ext4_get_group_desc() function returns NULL on error, and
ext4_free_inodes_count() function dereferences it without checking.
There is a check on the next line, but it's too late.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: cleaned up the style

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index a044a9b..ea32d7e 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -508,10 +508,12 @@ fallback_retry:
 	for (i = 0; i < ngroups; i++) {
 		grp = (parent_group + i) % ngroups;
 		desc = ext4_get_group_desc(sb, grp, NULL);
-		grp_free = ext4_free_inodes_count(sb, desc);
-		if (desc && grp_free && grp_free >= avefreei) {
-			*group = grp;
-			return 0;
+		if (desc) {
+			grp_free = ext4_free_inodes_count(sb, desc);
+			if (grp_free && grp_free >= avefreei) {
+				*group = grp;
+				return 0;
+			}
 		}
 	}
 
