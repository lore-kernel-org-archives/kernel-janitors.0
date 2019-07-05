From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 09:36:12 +0000
Subject: [PATCH] power: supply: isp1704: remove redundant assignment to variable ret
Message-Id: <20190705093612.21925-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never
read and it is being updated later with a new value. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/isp1704_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/isp1704_charger.c b/drivers/power/supply/isp1704_charger.c
index b48cb7aba97b..4812ac1ff2df 100644
--- a/drivers/power/supply/isp1704_charger.c
+++ b/drivers/power/supply/isp1704_charger.c
@@ -342,7 +342,7 @@ static inline int isp1704_test_ulpi(struct isp1704_charger *isp)
 	int vendor;
 	int product;
 	int i;
-	int ret = -ENODEV;
+	int ret;
 
 	/* Test ULPI interface */
 	ret = isp1704_write(isp, ULPI_SCRATCH, 0xaa);
-- 
2.20.1
