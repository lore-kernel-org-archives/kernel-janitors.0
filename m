From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 08:08:56 +0000
Subject: [patch] btrfs: scrub: silence an uninitialized variable warning
Message-Id: <20160311080856.GB31887@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's basically harmless if "ref_level" isn't initialized since it's only
used for an error message, but it causes a static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index e42aa27..39dbdcb 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -611,7 +611,7 @@ static void scrub_print_warning(const char *errstr, struct scrub_block *sblock)
 	u64 flags = 0;
 	u64 ref_root;
 	u32 item_size;
-	u8 ref_level;
+	u8 ref_level = 0;
 	int ret;
 
 	WARN_ON(sblock->page_count < 1);
