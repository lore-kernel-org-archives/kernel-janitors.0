From: Colin King <colin.king@canonical.com>
Date: Tue, 12 May 2020 18:22:53 +0000
Subject: [PATCH][next] fs: remove redundant assignment to variable ret
Message-Id: <20200512182253.223249-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value that is never read and it
is being updated later with a new value. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index b0a511bef4a0..6674c2af26ef 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -2052,7 +2052,6 @@ SYSCALL_DEFINE5(watch_sb,
 		if (drop_s_count)
 			put_super(s);
 	} else {
-		ret = -EBADSLT;
 		down_write(&s->s_umount);
 		ret = remove_watch_from_object(s->s_watchers, wqueue,
 					       s->s_unique_id, false);
-- 
2.25.1
