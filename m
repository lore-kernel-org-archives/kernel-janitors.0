From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:06:23 +0000
Subject: [patch -resend] NVMe: handle allocation failure in nvme_map_user_pages()
Message-Id: <20120627090623.GO31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew.r.wilcox@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return here and avoid a NULL dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Originally sent on Fri, 20 Jan 2012.

diff --git a/drivers/block/nvme.c b/drivers/block/nvme.c
index 38a2d06..b4d85b9 100644
--- a/drivers/block/nvme.c
+++ b/drivers/block/nvme.c
@@ -1037,6 +1037,8 @@ static struct nvme_iod *nvme_map_user_pages(struct nvme_dev *dev, int write,
 	offset = offset_in_page(addr);
 	count = DIV_ROUND_UP(offset + length, PAGE_SIZE);
 	pages = kcalloc(count, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
 
 	err = get_user_pages_fast(addr, count, 1, pages);
 	if (err < count) {
