From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Oct 2020 14:17:58 +0000
Subject: [PATCH] net/sunrpc: clean up error checking in proc_do_xprt()
Message-Id: <20201027141758.GA3488087@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <031F93AC-744F-4E02-9948-1C1F5939714B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Artur Molchanov <arturmolchanov@gmail.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, Jakub Kicinski <kuba@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

There are three changes but none of them should affect run time:

1)  You can't write to this file because the permissions are 0444.  But
    it sort of looked like you could do a write and it would result in
    a read.  Then it looked like proc_sys_call_handler() just ignored
    it.  Which is confusing.  It's more clear if the "write" just
    returns zero.
2)  The "lenp" pointer is never NULL so that check can be removed.
3)  In the original code, the "if (*lenp < 0)" check didn't work because
    "*lenp" is unsigned.  Fortunately, the memory_read_from_buffer()
    call will never fail in this context so it doesn't affect runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sunrpc/sysctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
index a18b36b5422d..04526bab4a06 100644
--- a/net/sunrpc/sysctl.c
+++ b/net/sunrpc/sysctl.c
@@ -63,19 +63,19 @@ static int proc_do_xprt(struct ctl_table *table, int write,
 			void *buffer, size_t *lenp, loff_t *ppos)
 {
 	char tmpbuf[256];
-	size_t len;
+	ssize_t len;
 
-	if ((*ppos && !write) || !*lenp) {
-		*lenp = 0;
+	*lenp = 0;
+
+	if (write || *ppos)
 		return 0;
-	}
+
 	len = svc_print_xprts(tmpbuf, sizeof(tmpbuf));
-	*lenp = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
+	len = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
+	if (len < 0)
+		return len;
 
-	if (*lenp < 0) {
-		*lenp = 0;
-		return -EINVAL;
-	}
+	*lenp = len;
 	return 0;
 }
 
-- 
2.28.0
