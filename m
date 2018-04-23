From: Colin King <colin.king@canonical.com>
Date: Mon, 23 Apr 2018 12:49:38 +0000
Subject: [PATCH] dca: make function dca_common_get_tag static
Message-Id: <20180423124938.26070-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function dca_common_get_tag is local to the source and does not need to be
in global scope, so make it static.

Cleans up sparse warning:
drivers/dca/dca-core.c:273:4: warning: symbol 'dca_common_get_tag' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dca/dca-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index 7afbb28d6a0f..1bc5ffb338c8 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -270,7 +270,7 @@ EXPORT_SYMBOL_GPL(dca_remove_requester);
  * @dev - the device that wants dca service
  * @cpu - the cpuid as returned by get_cpu()
  */
-u8 dca_common_get_tag(struct device *dev, int cpu)
+static u8 dca_common_get_tag(struct device *dev, int cpu)
 {
 	struct dca_provider *dca;
 	u8 tag;
-- 
2.17.0

