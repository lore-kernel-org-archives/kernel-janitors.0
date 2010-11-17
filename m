From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 05:07:32 +0000
Subject: [patch] ext4: missing unlock in ext4_clear_request_list()
Message-Id: <20101117050732.GB31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Lukas Czerner <lczerner@redhat.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If the the li_request_list was empty then it returned with the lock
held.  Instead of adding a "goto unlock" I just removed that special
case and let it go past the empty list_for_each_safe().

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker patch.

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 61182fe..ef09d14 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2799,9 +2799,6 @@ static void ext4_clear_request_list(void)
 	struct ext4_li_request *elr;
 
 	mutex_lock(&ext4_li_info->li_list_mtx);
-	if (list_empty(&ext4_li_info->li_request_list))
-		return;
-
 	list_for_each_safe(pos, n, &ext4_li_info->li_request_list) {
 		elr = list_entry(pos, struct ext4_li_request,
 				 lr_request);
