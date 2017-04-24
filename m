From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 12:40:07 +0000
Subject: [PATCH 1/3] extcon: Use devm_kcalloc() in extcon_dev_register()
Message-Id: <309234f0-ce27-0db7-dc70-802b59b1cc88@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
In-Reply-To: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 20:54:11 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "devm_kcalloc".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index f422a78ba342..acb847bc1619 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -1252,9 +1252,8 @@ int extcon_dev_register(struct extcon_dev *edev)
 	}
 
 	spin_lock_init(&edev->lock);
-
-	edev->nh = devm_kzalloc(&edev->dev,
-			sizeof(*edev->nh) * edev->max_supported, GFP_KERNEL);
+	edev->nh = devm_kcalloc(&edev->dev, edev->max_supported,
+				sizeof(*edev->nh), GFP_KERNEL);
 	if (!edev->nh) {
 		ret = -ENOMEM;
 		goto err_dev;
-- 
2.12.2

