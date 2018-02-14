From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 10:22:28 +0000
Subject: [PATCH 4/4] crypto: ux500: Delete two unnecessary variable initialisations in ux500_cryp_probe()
Message-Id: <b8fb9abe-2ac4-d720-b676-79083fc7e5e6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
In-Reply-To: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Geliang Tang <geliangtang@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 10:56:38 +0100

Two local variables will eventually be set to appropriate pointers
a bit later. Thus omit their explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/crypto/ux500/cryp/cryp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ux500/cryp/cryp_core.c b/drivers/crypto/ux500/cryp/cryp_core.c
index 7c811d7eb274..cb31b59c9d53 100644
--- a/drivers/crypto/ux500/cryp/cryp_core.c
+++ b/drivers/crypto/ux500/cryp/cryp_core.c
@@ -1404,8 +1404,8 @@ static void cryp_algs_unregister_all(void)
 static int ux500_cryp_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *res = NULL;
-	struct resource *res_irq = NULL;
+	struct resource *res;
+	struct resource *res_irq;
 	struct cryp_device_data *device_data;
 	struct cryp_protection_config prot = {
 		.privilege_access = CRYP_STATE_ENABLE
-- 
2.16.1

