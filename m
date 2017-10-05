From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 09:55:57 +0000
Subject: [PATCH] libnvdimm, namespace: make a couple of functions static
Message-Id: <20171005095557.29063-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions create_namespace_pmem and create_namespace_blk are local
to the source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'create_namespace_pmem' was not declared. Should it be static?
symbol 'create_namespace_blk' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvdimm/namespace_devs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 3e4d1e7998da..2029e70a24f4 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1875,7 +1875,7 @@ static int select_pmem_id(struct nd_region *nd_region, u8 *pmem_id)
  * @nspm: target namespace to create
  * @nd_label: target pmem namespace label to evaluate
  */
-struct device *create_namespace_pmem(struct nd_region *nd_region,
+static struct device *create_namespace_pmem(struct nd_region *nd_region,
 		struct nd_namespace_index *nsindex,
 		struct nd_namespace_label *nd_label)
 {
@@ -2186,7 +2186,7 @@ static int add_namespace_resource(struct nd_region *nd_region,
 	return i;
 }
 
-struct device *create_namespace_blk(struct nd_region *nd_region,
+static struct device *create_namespace_blk(struct nd_region *nd_region,
 		struct nd_namespace_label *nd_label, int count)
 {
 
-- 
2.14.1

