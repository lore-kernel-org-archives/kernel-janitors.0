From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 09:26:03 +0000
Subject: [PATCH 6/9] pinctrl: Combine substrings for a message in pin_config_group_get()
Message-Id: <04433cd2-002c-6534-622e-49ecb2dcfdc8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 10:22:47 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index f2168b6e3418..037ac3e47891 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -87,9 +87,8 @@ int pin_config_group_get(const char *dev_name, const char *pin_group,
 	ops = pctldev->desc->confops;
 
 	if (!ops || !ops->pin_config_group_get) {
-		dev_dbg(pctldev->dev, "cannot get configuration for pin "
-			"group, missing group config get function in "
-			"driver\n");
+		dev_dbg(pctldev->dev,
+			"cannot get configuration for pin group, missing group config get function in driver\n");
 		ret = -ENOTSUPP;
 		goto unlock;
 	}
-- 
2.12.2

