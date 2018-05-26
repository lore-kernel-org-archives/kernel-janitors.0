From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 14:57:13 +0000
Subject: [PATCH] mfd: timberdale: fix spelling mistake "Uknown" -> "Unknown"
Message-Id: <20180526145713.10160-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 33abf5a79f2b..f49168fac223 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -777,7 +777,7 @@ static int timb_probe(struct pci_dev *dev,
 			&dev->resource[0], msix_entries[0].vector, NULL);
 		break;
 	default:
-		dev_err(&dev->dev, "Uknown IP setup: %d.%d.%d\n",
+		dev_err(&dev->dev, "Unknown IP setup: %d.%d.%d\n",
 			priv->fw.major, priv->fw.minor, ip_setup);
 		err = -ENODEV;
 		goto err_mfd;
-- 
2.17.0

