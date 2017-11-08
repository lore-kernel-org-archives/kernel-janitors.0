From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Nov 2017 13:00:30 +0000
Subject: [PATCH] xen/privcmd: remove unused variable pageidx
Message-Id: <20171108130030.25394-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable pageidx is assigned a value but it is never read, hence it
is redundant and can be removed. Cleans up clang warning:

drivers/xen/privcmd.c:199:2: warning: Value stored to 'pageidx'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/privcmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index feca75b07fdd..1c909183c42a 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -191,13 +191,10 @@ static int traverse_pages_block(unsigned nelem, size_t size,
 				void *state)
 {
 	void *pagedata;
-	unsigned pageidx;
 	int ret = 0;
 
 	BUG_ON(size > PAGE_SIZE);
 
-	pageidx = PAGE_SIZE;
-
 	while (nelem) {
 		int nr = (PAGE_SIZE/size);
 		struct page *page;
-- 
2.14.1

