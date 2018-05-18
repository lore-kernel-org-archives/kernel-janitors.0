From: Colin King <colin.king@canonical.com>
Date: Fri, 18 May 2018 10:03:59 +0000
Subject: [PATCH] staging: mt7621-mmc: fix spelling mistake: "Eanable" -> "Enable"
Message-Id: <20180518100359.28036-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Christian=20L=C3=BCtke-Stetzkamp?= <christian@lkamp.de>, NeilBrown <neil@brown.name>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in N_MSG message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/mt7621-mmc/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-mmc/sd.c b/drivers/staging/mt7621-mmc/sd.c
index ddac4ce6457b..11bf4b4c3403 100644
--- a/drivers/staging/mt7621-mmc/sd.c
+++ b/drivers/staging/mt7621-mmc/sd.c
@@ -2032,7 +2032,7 @@ static void msdc_enable_cd_irq(struct msdc_host *host, int enable)
 		return;
 	}
 
-	N_MSG(CFG, "CD IRQ Eanable(%d)", enable);
+	N_MSG(CFG, "CD IRQ Enable(%d)", enable);
 
 	if (enable) {
 		/* card detection circuit relies on the core power so that the core power
-- 
2.17.0

