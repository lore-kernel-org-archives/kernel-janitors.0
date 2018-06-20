From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 11:08:56 +0000
Subject: [PATCH] kdb: Off by one bugs in kdbgetaddrarg()
Message-Id: <20180620110852.oavyzqhsos5fazma@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "*nextarg = argc" then we end up reading beyond the end of the
argv[] array.

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 2ddfce8f1e8f..214d09345056 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -522,7 +522,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 	 *  $environment-variable
 	 */
 
-	if (*nextarg > argc)
+	if (*nextarg >= argc)
 		return KDB_ARGCOUNT;
 
 	symname = (char *)argv[*nextarg];
@@ -574,7 +574,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 	if (offset && name && *name)
 		*offset = addr - symtab.sym_start;
 
-	if ((*nextarg > argc)
+	if ((*nextarg >= argc)
 	 && (symbol = '\0'))
 		return 0;
 
@@ -599,7 +599,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 	/*
 	 * Now there must be an offset!
 	 */
-	if ((*nextarg > argc)
+	if ((*nextarg >= argc)
 	 && (symbol = '\0')) {
 		return KDB_INVADDRFMT;
 	}
