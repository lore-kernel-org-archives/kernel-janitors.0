From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 May 2017 09:49:04 +0000
Subject: [PATCH] fs/seq_file: remove some dead code
Message-Id: <20170520094904.45h7klchyzki2ini@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We have never used this "err = PTR_ERR(p);" assignment and it annoys
static checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/seq_file.c b/fs/seq_file.c
index 13e8c092d4d2..d6f82ce288f4 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -261,10 +261,8 @@ ssize_t seq_read(struct file *file, char __user *buf, size_t size, loff_t *ppos)
 		size_t offs = m->count;
 		loff_t next = pos;
 		p = m->op->next(m, p, &next);
-		if (!p || IS_ERR(p)) {
-			err = PTR_ERR(p);
+		if (!p || IS_ERR(p))
 			break;
-		}
 		err = m->op->show(m, p);
 		if (seq_has_overflowed(m) || err) {
 			m->count = offs;
