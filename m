From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 21:29:13 +0000
Subject: [patch] padata: add parenthesis in MAX_SEQ_NR macro
Message-Id: <20100525212913.GK22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.hengli.com.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Henrik Kretzschmar <henne@nachtwindheim.de>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

MAX_SEQ_NR is used in padata_alloc_pd() like this:

        pd->max_seq_nr = (MAX_SEQ_NR / num_cpus) * num_cpus - 1;

It needs parenthesis or the divide by num_cpus takes precedence over the
subtraction.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found by a static checker.  I don't really know this code.

diff --git a/kernel/padata.c b/kernel/padata.c
index b1c9857..ff8de1b 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -28,7 +28,7 @@
 #include <linux/slab.h>
 #include <linux/rcupdate.h>
 
-#define MAX_SEQ_NR INT_MAX - NR_CPUS
+#define MAX_SEQ_NR (INT_MAX - NR_CPUS)
 #define MAX_OBJ_NUM 1000
 
 static int padata_index_to_cpu(struct parallel_data *pd, int cpu_index)
