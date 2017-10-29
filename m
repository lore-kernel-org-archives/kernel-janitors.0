From: Colin King <colin.king@canonical.com>
Date: Sun, 29 Oct 2017 12:58:51 +0000
Subject: [PATCH] mfd: ti_am335x_tscadc: remove redundant assignment to node
Message-Id: <20171029125851.5727-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Node is being initialized a value that is never read, it is
being written over a few statements into the function with
the return value from call to of_get_child_by_name. Hence
this initialization can be removed. Cleans up clang warning:

drivers/mfd/ti_am335x_tscadc.c:127:22: warning: Value stored
to 'node' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/ti_am335x_tscadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 0f3fab47fe48..3cd958a31f36 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -124,7 +124,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	struct ti_tscadc_dev	*tscadc;
 	struct resource		*res;
 	struct clk		*clk;
-	struct device_node	*node = pdev->dev.of_node;
+	struct device_node	*node;
 	struct mfd_cell		*cell;
 	struct property         *prop;
 	const __be32            *cur;
-- 
2.14.1

