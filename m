From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 17 Oct 2018 09:13:59 +0000
Subject: [PATCH] btrfs: Fix the return value in case of error in 'btrfs_mark_extent_written()'
Message-Id: <20181017091359.3763-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: clm@fb.com, jbacik@fb.com, dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We return 0 unconditionally in most of the error handling paths of
'btrfs_mark_extent_written()'.
However, 'ret' is set to some error codes in several error handling paths.

Return 'ret' instead to propagate the error code.

Fixes: 9c8e63db1de9 ("Btrfs: kill BUG_ON()'s in btrfs_mark_extent_written")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch proposal is purely speculative.
I'm not sure at all that returning 'ret' is correct (but it looks like it
is :) )

What puzzles me is when 'ret' is set, 'btrfs_abort_transaction()' is also
called.
However, the only caller of 'btrfs_mark_extent_written()' (i.e.
'btrfs_finish_ordered_io()') also calls 'btrfs_abort_transaction()' if an
error is returned.
So returning an error code here, would lead to a double call to this abort
function.

I'm usure of if it is correct and/or intented.
If returning 'ret' is correct, should we also axe the 'btrfs_abort_transaction()'
calls here, and leave the caller do the clean-up?

Before the commit in the Fixes tag, we were BUGing_ON in case of errror. So
propagating the error was pointless.
---
 fs/btrfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 15b925142793..cac0bd744de3 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1374,7 +1374,7 @@ int btrfs_mark_extent_written(struct btrfs_trans_handle *trans,
 	}
 out:
 	btrfs_free_path(path);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.17.1
