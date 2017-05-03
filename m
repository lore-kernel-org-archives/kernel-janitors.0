From: Colin King <colin.king@canonical.com>
Date: Wed, 03 May 2017 10:33:57 +0000
Subject: [PATCH] power: supply: twl4030-charger: make twl4030_bci_property_is_writeable static
Message-Id: <20170503103357.22598-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H . Nikolaus Schaller" <hns@goldelico.com>, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function twl4030_bci_property_is_writeable can be made static
as it does not need to be in global scope.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/twl4030_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/twl4030_charger.c b/drivers/power/supply/twl4030_charger.c
index abd10f6861ae..2f82d0e9ec1b 100644
--- a/drivers/power/supply/twl4030_charger.c
+++ b/drivers/power/supply/twl4030_charger.c
@@ -943,7 +943,7 @@ static int twl4030_bci_set_property(struct power_supply *psy,
 	return 0;
 }
 
-int twl4030_bci_property_is_writeable(struct power_supply *psy,
+static int twl4030_bci_property_is_writeable(struct power_supply *psy,
 				      enum power_supply_property psp)
 {
 	switch (psp) {
-- 
2.11.0

