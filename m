From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Feb 2018 14:08:52 +0000
Subject: [PATCH] libnvdimm: remove redundant assignment to pointer 'dev'
Message-Id: <20180205140852.14110-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is being assigned a value that is never read, it is being
re-assigned the same value later on, hence the initialization is redundant
and can be removed.

Cleans up clang warning:
drivers/nvdimm/pfn_devs.c:307:17: warning: Value stored to 'dev' during
its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvdimm/pfn_devs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index f5c4e8c6e29d..2f4d18752c97 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -304,7 +304,7 @@ static const struct attribute_group *nd_pfn_attribute_groups[] = {
 struct device *nd_pfn_devinit(struct nd_pfn *nd_pfn,
 		struct nd_namespace_common *ndns)
 {
-	struct device *dev = &nd_pfn->dev;
+	struct device *dev;
 
 	if (!nd_pfn)
 		return NULL;
-- 
2.15.1

