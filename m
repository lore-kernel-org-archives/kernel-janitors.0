From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 14:10:31 +0000
Subject: [patch v2] locks: missing unlock on error in generic_add_lease()
Message-Id: <20131113141031.GA29645@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113135103.GA27536@pad.fieldses.org>
In-Reply-To: <20131113135103.GA27536@pad.fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>, "J. Bruce Fields" <bfields@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here before returning.

Fixes: df4e8d2c1d2b ('locks: implement delegations')
Acked-by: J. Bruce Fields <bfields@redhat.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Style fix

diff --git a/fs/locks.c b/fs/locks.c
index f99d52b..7b7ed7d 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1495,7 +1495,8 @@ static int generic_add_lease(struct file *filp, long arg, struct file_lock **flp
 	if (is_deleg && arg = F_WRLCK) {
 		/* Write delegations are not currently supported: */
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		error = -EINVAL;
+		goto out;
 	}
 
 	error = -EAGAIN;
