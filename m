From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:35:01 +0000
Subject: [PATCH 8/11] fs/btrfs/volumes.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-9-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/btrfs/volumes.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 19450bc..275be0f 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1983,8 +1983,8 @@ again:
 						   found_key.offset);
 			if (ret = -ENOSPC)
 				failed++;
-			else if (ret)
-				BUG();
+			else
+				BUG_ON(ret);
 		}
 
 		if (found_key.offset = 0)

