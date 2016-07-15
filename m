From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 21:09:53 +0000
Subject: [patch] testing/radix-tree: fix a macro expansion bug
Message-Id: <20160715210953.GC19522@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Konstantin Khlebnikov <koct9i@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are no parentheses around this macro and it causes a problem when
we do:

	index = rand() % THRASH_SIZE;

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/testing/radix-tree/tag_check.c b/tools/testing/radix-tree/tag_check.c
index b7447ce..b0ac057 100644
--- a/tools/testing/radix-tree/tag_check.c
+++ b/tools/testing/radix-tree/tag_check.c
@@ -122,7 +122,7 @@ enum {
 	NODE_TAGGED = 2,
 };
 
-#define THRASH_SIZE		1000 * 1000
+#define THRASH_SIZE		(1000 * 1000)
 #define N 127
 #define BATCH	33
 
