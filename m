From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2012 07:06:05 +0000
Subject: [patch] NFS: add an endian notation
Message-Id: <20120112070605.GA2975@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This function returns a big endian value.  The implementation in
fs/nfs/callback_proc.c is declared with "__be32" but the .h file uses
"unsigned" instead.  It makes sparse complain:

fs/nfs/callback_proc.c:232:8: error:
	symbol 'nfs4_callback_layoutrecall' redeclared with different
	type (originally declared at fs/nfs/callback.h:165) - different
	base types

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/callback.h b/fs/nfs/callback.h
index 07df5f1..c89d3b9 100644
--- a/fs/nfs/callback.h
+++ b/fs/nfs/callback.h
@@ -162,7 +162,7 @@ struct cb_layoutrecallargs {
 	};
 };
 
-extern unsigned nfs4_callback_layoutrecall(
+extern __be32 nfs4_callback_layoutrecall(
 	struct cb_layoutrecallargs *args,
 	void *dummy, struct cb_process_state *cps);
 
