From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2013 12:07:38 +0000
Subject: [patch -mm] mm, vmalloc: unbreak __vunmap()
Message-Id: <20130607120738.GA13851@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>, Zhang Yanfei <zhangyanfei@cn.fujitsu.com>, David Rientjes <rientjes@google.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an extra semi-colon so the function always returns.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 91a1047..96b77a9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1453,7 +1453,7 @@ static void __vunmap(const void *addr, int deallocate_pages)
 		return;
 
 	if (WARN(!PAGE_ALIGNED(addr), "Trying to vfree() bad address (%p)\n",
-			addr));
+			addr))
 		return;
 
 	area = remove_vm_area(addr);
