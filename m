From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Feb 2021 19:53:13 +0000
Subject: [PATCH][next] cxl/mem: remove redundant initialization of variable rc
Message-Id: <20210215195313.90231-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>, Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/cxl/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
index 3bca8451348a..81e557a54fa4 100644
--- a/drivers/cxl/mem.c
+++ b/drivers/cxl/mem.c
@@ -383,8 +383,8 @@ static int __cxl_mem_mbox_send_cmd(struct cxl_mem *cxlm,
 static int cxl_mem_mbox_get(struct cxl_mem *cxlm)
 {
 	struct device *dev = &cxlm->pdev->dev;
-	int rc = -EBUSY;
 	u64 md_status;
+	int rc;
 
 	mutex_lock_io(&cxlm->mbox_mutex);
 
-- 
2.30.0
