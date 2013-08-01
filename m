From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Aug 2013 15:47:05 +0000
Subject: [patch] fs/binfmts: double unlock in search_binary_handler()
Message-Id: <20130801154705.GC5198@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zach Levis <zml@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org

The recent -mm patch 3046d15088 "fs/binfmts: better handling of binfmt
loops" introduced a new "continue" to the loop.  The problem is that we
are supposed to be holding the lock at the start so we need to take it
again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.

diff --git a/fs/exec.c b/fs/exec.c
index f8b7ed1..e2785fc 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1426,6 +1426,7 @@ int search_binary_handler(struct linux_binprm *bprm)
 				copy_strings(bprm->argc_orig, *((struct user_arg_ptr *) bprm->argv_orig), bprm);
 				bprm->argc = bprm->argc_orig;
 				retval = -ENOEXEC;
+				read_lock(&binfmt_lock);
 				continue;
 			}
 
