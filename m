From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Jul 2013 12:20:25 +0000
Subject: [patch v2] Squashfs: sanity check information from disk
Message-Id: <20130717122025.GA14232@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAB3wodeBWvgF9oKb9OVXNABiafhvLticB=x8s=R81RRv9Yd6kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We read the size of the name from the disk, but a larger name than
expected would cause memory corruption.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 7834a51..bc1334c 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -79,7 +79,8 @@ static int get_dir_index_using_name(struct super_block *sb,
 			int len)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int i, size, length = 0, err;
+	int i, length = 0, err;
+	unsigned int size;
 	struct squashfs_dir_index *index;
 	char *str;
 
@@ -103,6 +104,10 @@ static int get_dir_index_using_name(struct super_block *sb,
 
 
 		size = le32_to_cpu(index->size) + 1;
+		if (size > SQUASHFS_NAME_LEN) {
+			err = -EINVAL;
+			break;
+		}
 
 		err = squashfs_read_metadata(sb, index->name, &index_start,
 					&index_offset, size);

