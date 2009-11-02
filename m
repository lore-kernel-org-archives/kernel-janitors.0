From: Julia Lawall <julia@diku.dk>
Date: Mon, 02 Nov 2009 20:58:47 +0000
Subject: [PATCH] fs/ext4: test the i_flags field of the right structure
Message-Id: <Pine.LNX.4.64.0911022158190.4930@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sandeen@redhat.com, cmm@us.ibm.com, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger@sun.com>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Elsewhere, EXT4_EXTENTS_FL is combined with EXT4_I(inode)->i_flags, rather
than inode->i_flags.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/ext4/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 5c5bc5d..c0e34ab 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2787,7 +2787,7 @@ static int ext4_da_writepages_trans_blocks(struct inode *inode)
 	 * number of contiguous block. So we will limit
 	 * number of contiguous block to a sane value
 	 */
-	if (!(inode->i_flags & EXT4_EXTENTS_FL) &&
+	if (!(EXT4_I(inode)->i_flags & EXT4_EXTENTS_FL) &&
 	    (max_blocks > EXT4_MAX_TRANS_DATA))
 		max_blocks = EXT4_MAX_TRANS_DATA;
 
