From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 14:30:12 +0000
Subject: [PATCH] mm/shmem.c: make array 'values' static const, makes object smaller
Message-Id: <20190906143012.28698-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hugh Dickins <hughd@google.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'values' on the stack but instead make it
static const. Makes the object code smaller by 111 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 108612	  11169	    512	 120293	  1d5e5	mm/shmem.o

After:
   text	   data	    bss	    dec	    hex	filename
 108437	  11233	    512	 120182	  1d576	mm/shmem.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 77d2df011c0e..30e1de87bdca 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3934,7 +3934,7 @@ int __init shmem_init(void)
 static ssize_t shmem_enabled_show(struct kobject *kobj,
 		struct kobj_attribute *attr, char *buf)
 {
-	int values[] = {
+	static const int values[] = {
 		SHMEM_HUGE_ALWAYS,
 		SHMEM_HUGE_WITHIN_SIZE,
 		SHMEM_HUGE_ADVISE,
-- 
2.20.1
