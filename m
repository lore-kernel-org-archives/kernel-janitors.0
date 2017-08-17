From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 20:15:28 +0000
Subject: [PATCH 3/3] orangefs: Adjust three checks for null pointers
Message-Id: <de3d2074-9ba4-7bf6-02cc-eb8387b59524@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
In-Reply-To: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Martin Brandenburg <martin@omnibond.com>, Mike Marshall <hubcap@omnibond.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 21:35:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/orangefs/acl.c   | 2 +-
 fs/orangefs/xattr.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/orangefs/acl.c b/fs/orangefs/acl.c
index 7a3754488312..4ea7da31e7f0 100644
--- a/fs/orangefs/acl.c
+++ b/fs/orangefs/acl.c
@@ -35,7 +35,7 @@ struct posix_acl *orangefs_get_acl(struct inode *inode, int type)
 	 * I don't do that for now.
 	 */
 	value = kmalloc(ORANGEFS_MAX_XATTR_VALUELEN, GFP_KERNEL);
-	if (value = NULL)
+	if (!value)
 		return ERR_PTR(-ENOMEM);
 
 	gossip_debug(GOSSIP_ACL_DEBUG,
diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
index 237c9c04dc3b..8d40e01ed0f8 100644
--- a/fs/orangefs/xattr.c
+++ b/fs/orangefs/xattr.c
@@ -239,7 +239,7 @@ int orangefs_inode_setxattr(struct inode *inode, const char *name,
 	internal_flag = convert_to_internal_xattr_flags(flags);
 
 	/* This is equivalent to a removexattr */
-	if (size = 0 && value = NULL) {
+	if (size = 0 && !value) {
 		gossip_debug(GOSSIP_XATTR_DEBUG,
 			     "removing xattr (%s)\n",
 			     name);
@@ -311,7 +311,7 @@ ssize_t orangefs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	int i = 0;
 	int returned_count = 0;
 
-	if (size > 0 && buffer = NULL) {
+	if (size > 0 && !buffer) {
 		gossip_err("%s: bogus NULL pointers\n", __func__);
 		return -EINVAL;
 	}
-- 
2.14.0

