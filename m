From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 11:28:10 +0000
Subject: [patch] debugobjects: fill_pool() returns void now
Message-Id: <20120418112810.GA2669@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a return missed in 1fda107d44 "debugobjects: Remove unused
return value from fill_pool()".  It makes gcc complain:

	lib/debugobjects.c: In function ‘fill_pool’:
	lib/debugobjects.c:98:4: warning: ‘return’ with a value, in
		function returning void [enabled by default]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 1b6c00a..d11808c 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -95,7 +95,7 @@ static void fill_pool(void)
 
 		new = kmem_cache_zalloc(obj_cache, gfp);
 		if (!new)
-			return obj_pool_free;
+			return;
 
 		raw_spin_lock_irqsave(&pool_lock, flags);
 		hlist_add_head(&new->node, &obj_pool);
