From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Oct 2018 18:48:41 +0000
Subject: [PATCH] power: supply: cpcap-charger: clean an indentation issue, remove tab
Message-Id: <20181031184841.5673-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issue, remove an extraneous tab

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/cpcap-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index e4905bef2663..c843eaff8ad0 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -544,7 +544,7 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		if (IS_ERR(ddata->gpio[i])) {
 			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
 				 i, PTR_ERR(ddata->gpio[i]));
-				 ddata->gpio[i] = NULL;
+			ddata->gpio[i] = NULL;
 		}
 	}
 }
-- 
2.19.1
