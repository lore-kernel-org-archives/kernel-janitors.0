From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 11:14:04 +0000
Subject: [PATCH][next] staging: fsl-mc: make function its_fsl_mc_msi_init static
Message-Id: <20180117111404.19938-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function its_fsl_mc_msi_init is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'its_fsl_mc_msi_init' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
index ffeaea574a40..54463d3efa6a 100644
--- a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
@@ -67,7 +67,7 @@ static const struct of_device_id its_device_id[] = {
 	{},
 };
 
-int __init its_fsl_mc_msi_init(void)
+static int __init its_fsl_mc_msi_init(void)
 {
 	struct device_node *np;
 	struct irq_domain *parent;
-- 
2.15.1

