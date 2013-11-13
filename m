From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:56:27 +0000
Subject: [patch] locks: missing unlock on error in generic_add_lease()
Message-Id: <20131113075627.GJ25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>, "J. Bruce Fields" <bfields@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here before returning.

Fixes: df4e8d2c1d2b ('locks: implement delegations')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.

diff --git a/fs/locks.c b/fs/locks.c
index f99d52b..92a0f0a 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1494,6 +1494,7 @@ static int generic_add_lease(struct file *filp, long arg, struct file_lock **flp
 
 	if (is_deleg && arg = F_WRLCK) {
 		/* Write delegations are not currently supported: */
+		mutex_unlock(&inode->i_mutex);
 		WARN_ON_ONCE(1);
 		return -EINVAL;
 	}
