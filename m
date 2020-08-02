From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 17:50:07 +0000
Subject: [PATCH] spi: a3700: Remove a useless memset
Message-Id: <20200802175007.703995-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Memory allocated by 'spi_alloc_master()' is already zeroed.
Remove a redundant memset.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-armada-3700.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index fcde419e480c..46feafe4e201 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -848,7 +848,6 @@ static int a3700_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, master);
 
 	spi = spi_master_get_devdata(master);
-	memset(spi, 0, sizeof(struct a3700_spi));
 
 	spi->master = master;
 
-- 
2.25.1
