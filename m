From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2019 11:54:10 +0000
Subject: [PATCH] soc: ixp4xx: npe: Fix an IS_ERR() vs NULL check in probe
Message-Id: <20190618115410.GE18776@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CACRpkdaX66=g7dG7SFkgr5Dwmop-p4qe7ELkn0KERtqVvp0vNA@mail.gmail.com>
References: <20190613070201.GH16334@mwanda>
In-Reply-To: <20190613070201.GH16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arm@kernel.org
Cc: Krzysztof Halasa <khalasa@piap.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap_resource() function doesn't return NULL, it returns
error pointers.

Fixes: 0b458d7b10f8 ("soc: ixp4xx: npe: Pass addresses as resources")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/soc/ixp4xx/ixp4xx-npe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index bc10e3194809..ec90b44fa0cd 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -695,8 +695,8 @@ static int ixp4xx_npe_probe(struct platform_device *pdev)
 			continue; /* NPE already disabled or not present */
 		}
 		npe->regs = devm_ioremap_resource(dev, res);
-		if (!npe->regs)
-			return -ENOMEM;
+		if (IS_ERR(npe->regs))
+			return PTR_ERR(npe->regs);
 
 		if (npe_reset(npe)) {
 			dev_info(dev, "NPE%d at 0x%08x-0x%08x does not reset\n",
-- 
2.20.1
