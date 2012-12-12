From: Cyril Roelandt <tipecaml@gmail.com>
Date: Wed, 12 Dec 2012 00:24:54 +0000
Subject: [PATCH 5/5] spi: fix return value check in hspi_probe().
Message-Id: <1355271894-5284-6-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355271894-5284-1-git-send-email-tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyril Roelandt <tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

According to its documentation, clk_get() returns a "valid IS_ERR() condition
containing errno", so we should call IS_ERR() rather than a NULL check.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/spi/spi-sh-hspi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index 32f7b55..60cfae5 100644
--- a/drivers/spi/spi-sh-hspi.c
+++ b/drivers/spi/spi-sh-hspi.c
@@ -290,7 +290,7 @@ static int hspi_probe(struct platform_device *pdev)
 	}
 
 	clk = clk_get(NULL, "shyway_clk");
-	if (!clk) {
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "shyway_clk is required\n");
 		ret = -EINVAL;
 		goto error0;
-- 
1.7.10.4

