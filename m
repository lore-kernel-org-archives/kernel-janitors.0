From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 07:19:34 +0000
Subject: [PATCH 4/4] isofs: Delete an unnecessary variable initialisation in isofs_read_inode()
Message-Id: <0f5ac17e-16bc-7a36-262a-ec7d78de497f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
In-Reply-To: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jan Kara <jack@suse.cz>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 08:13:46 +0200

The local variable "bh" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/isofs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index f6d6c2ca8723..3a33b3db712a 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1298,7 +1298,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 	unsigned long bufsize = ISOFS_BUFFER_SIZE(inode);
 	unsigned long block;
 	int high_sierra = sbi->s_high_sierra;
-	struct buffer_head *bh = NULL;
+	struct buffer_head *bh;
 	struct iso_directory_record *de;
 	struct iso_directory_record *tmpde = NULL;
 	unsigned int de_len;
-- 
2.14.0

