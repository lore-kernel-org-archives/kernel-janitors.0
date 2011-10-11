From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2011 13:49:12 +0000
Subject: [patch] ext4: error handling fix in ext4_ext_convert_to_initialized()
Message-Id: <20111011134912.GB27127@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Yongqiang Yang <xiaoqiangnk@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

When allocated is unsiged it breaks the error handling at the end
of the function when we call:
	allocated = ext4_split_extent(...);
	if (allocated < 0)
		err = allocated;

I've made it a signed int instead of unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
You guys know I'm not an ext4 expert.  I can't swear that the math
all works correctly with a signed int.  I'm pretty sure it does, but
please review this carefully.

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 57cf568..d65b268 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -2919,7 +2919,8 @@ static int ext4_ext_convert_to_initialized(handle_t *handle,
 	struct ext4_extent zero_ex;
 	struct ext4_extent *ex;
 	ext4_lblk_t ee_block, eof_block;
-	unsigned int allocated, ee_len, depth;
+	unsigned int ee_len, depth;
+	int allocated;
 	int err = 0;
 	int split_flag = 0;
 
