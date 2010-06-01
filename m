From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:15:50 +0000
Subject: [patch] autofs4: remove unneeded null check in try_to_fill_dentry()
Message-Id: <20100601071550.GI5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

After 97e7449a7ad: "autofs4: fix indirect mount pending expire race" we
know longer assumed that "ino" can be null.  The other null checks got
removed but this was one as missed.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/autofs4/root.c b/fs/autofs4/root.c
index db4117e..5c0b93f 100644
--- a/fs/autofs4/root.c
+++ b/fs/autofs4/root.c
@@ -198,8 +198,7 @@ static int try_to_fill_dentry(struct dentry *dentry, int flags)
 	}
 
 	/* Initialize expiry counter after successful mount */
-	if (ino)
-		ino->last_used = jiffies;
+	ino->last_used = jiffies;
 
 	spin_lock(&sbi->fs_lock);
 	ino->flags &= ~AUTOFS_INF_PENDING;
