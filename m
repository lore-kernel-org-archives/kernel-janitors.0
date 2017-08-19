From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 07:17:28 +0000
Subject: [PATCH 2/4] isofs: Adjust four checks for null pointers
Message-Id: <b2d3ec4f-065a-84b8-c85d-8d7f9741d458@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
In-Reply-To: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jan Kara <jack@suse.cz>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 21:47:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/isofs/inode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index 2d3f090944df..db43f52f2268 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -96,7 +96,7 @@ static int __init init_inodecache(void)
 					0, (SLAB_RECLAIM_ACCOUNT|
 					SLAB_MEM_SPREAD|SLAB_ACCOUNT),
 					init_once);
-	if (isofs_inode_cachep = NULL)
+	if (!isofs_inode_cachep)
 		return -ENOMEM;
 	return 0;
 }
@@ -678,7 +678,7 @@ static int isofs_fill_super(struct super_block *s, void *data, int silent)
 			if (isonum_711(vdp->type) = ISO_VD_END)
 				break;
 			if (isonum_711(vdp->type) = ISO_VD_PRIMARY) {
-				if (pri = NULL) {
+				if (!pri) {
 					pri = (struct iso_primary_descriptor *)vdp;
 					/* Save the buffer in case we need it ... */
 					pri_bh = bh;
@@ -742,7 +742,7 @@ static int isofs_fill_super(struct super_block *s, void *data, int silent)
 		goto out_freebh;
 	}
 
-	if (joliet_level && (pri = NULL || !opt.rock)) {
+	if (joliet_level && (!pri || !opt.rock)) {
 		/* This is the case of Joliet with the norock mount flag.
 		 * A disc with both Joliet and Rock Ridge is handled later
 		 */
@@ -1320,5 +1320,5 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 		int frag1 = bufsize - offset;
 
 		tmpde = kmalloc(de_len, GFP_KERNEL);
-		if (tmpde = NULL) {
+		if (!tmpde) {
 			ret = -ENOMEM;
-- 
2.14.0

