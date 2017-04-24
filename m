From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 12:43:55 +0000
Subject: [PATCH 3/3] extcon: arizona: Use devm_kcalloc() in arizona_extcon_get_micd_configs()
Message-Id: <1a203761-76b9-bf3c-c034-0bb81fe6006a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
In-Reply-To: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 22:44:19 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon-arizona.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index e2d78cd7030d..f84da4a17724 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1271,9 +1271,7 @@ static int arizona_extcon_get_micd_configs(struct device *dev,
 		goto out;
 
 	nconfs /= entries_per_config;
-
-	micd_configs = devm_kzalloc(dev,
-				    nconfs * sizeof(struct arizona_micd_range),
+	micd_configs = devm_kcalloc(dev, nconfs, sizeof(*micd_configs),
 				    GFP_KERNEL);
 	if (!micd_configs) {
 		ret = -ENOMEM;
-- 
2.12.2

