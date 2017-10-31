From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 11:20:51 +0000
Subject: [PATCH] pinctrl: ti-iodelay: remove redundant unused variable dev
Message-Id: <20171031112051.21451-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer dev is being assigned but is never used, hence it is
redundant and can be removed. Cleans up clang warnings:

drivers/pinctrl/ti/pinctrl-ti-iodelay.c:582:2: warning: Value stored
to 'dev' is never read
drivers/pinctrl/ti/pinctrl-ti-iodelay.c:701:2: warning: Value stored
to 'dev' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 5c1b6325d80d..a8a6510183b6 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -575,11 +575,9 @@ static int ti_iodelay_pinconf_group_get(struct pinctrl_dev *pctldev,
 					unsigned long *config)
 {
 	struct ti_iodelay_device *iod;
-	struct device *dev;
 	struct ti_iodelay_pingroup *group;
 
 	iod = pinctrl_dev_get_drvdata(pctldev);
-	dev = iod->dev;
 	group = ti_iodelay_get_pingroup(iod, selector);
 
 	if (!group)
@@ -693,12 +691,10 @@ static void ti_iodelay_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 					      unsigned int selector)
 {
 	struct ti_iodelay_device *iod;
-	struct device *dev;
 	struct ti_iodelay_pingroup *group;
 	int i;
 
 	iod = pinctrl_dev_get_drvdata(pctldev);
-	dev = iod->dev;
 	group = ti_iodelay_get_pingroup(iod, selector);
 	if (!group)
 		return;
-- 
2.14.1

