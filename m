From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jan 2012 07:55:30 +0000
Subject: [patch] NVMe: handle allocation failure in nvme_map_user_pages()
Message-Id: <20120120075529.GB2295@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew.r.wilcox@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return here and avoid a NULL dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/nvme.c b/drivers/block/nvme.c
index f4996b0..d826726 100644
--- a/drivers/block/nvme.c
+++ b/drivers/block/nvme.c
@@ -1042,6 +1042,8 @@ static struct nvme_iod *nvme_map_user_pages(struct nvme_dev *dev, int write,
 	offset = offset_in_page(addr);
 	count = DIV_ROUND_UP(offset + length, PAGE_SIZE);
 	pages = kcalloc(count, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
 
 	err = get_user_pages_fast(addr, count, 1, pages);
 	if (err < count) {
