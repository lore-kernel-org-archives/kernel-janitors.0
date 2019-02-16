From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 16 Feb 2019 03:36:18 +0000
Subject: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190216033618.116680-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/qib/qib_user_pages.c: In function 'qib_get_user_pages':
drivers/infiniband/hw/qib/qib_user_pages.c:103:16: warning:
 variable 'locked' set but not used [-Wunused-but-set-variable]
 
It's never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/qib/qib_user_pages.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
index ef8bcf366ddc..a5be36c07451 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -100,12 +100,12 @@ int qib_map_page(struct pci_dev *hwdev, struct page *page, dma_addr_t *daddr)
 int qib_get_user_pages(unsigned long start_page, size_t num_pages,
 		       struct page **p)
 {
-	unsigned long locked, lock_limit;
+	unsigned long lock_limit;
 	size_t got;
 	int ret;
 
 	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-	locked = atomic64_add_return(num_pages, &current->mm->pinned_vm);
+	atomic64_add_return(num_pages, &current->mm->pinned_vm);
 
 	if (num_pages > lock_limit && !capable(CAP_IPC_LOCK)) {
 		ret = -ENOMEM;
