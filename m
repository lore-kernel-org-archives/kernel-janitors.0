From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Feb 2014 08:39:45 +0000
Subject: [patch] ext3: remove an unneeded check in ext3_new_blocks()
Message-Id: <20140225083945.GC5023@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

We know "fatal" is zero here.  The code can be simplified a bit by
assigning directly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext3/balloc.c b/fs/ext3/balloc.c
index 22548f56197b..158b5d4ce067 100644
--- a/fs/ext3/balloc.c
+++ b/fs/ext3/balloc.c
@@ -1727,10 +1727,7 @@ allocated:
 	percpu_counter_sub(&sbi->s_freeblocks_counter, num);
 
 	BUFFER_TRACE(gdp_bh, "journal_dirty_metadata for group descriptor");
-	err = ext3_journal_dirty_metadata(handle, gdp_bh);
-	if (!fatal)
-		fatal = err;
-
+	fatal = ext3_journal_dirty_metadata(handle, gdp_bh);
 	if (fatal)
 		goto out;
 
