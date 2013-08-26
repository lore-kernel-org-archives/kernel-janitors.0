From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2013 16:36:38 +0000
Subject: [patch] pinctrl: mvebu: testing the wrong variable
Message-Id: <20130826163637.GG12428@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We wanted to test "*map" here instead of "map".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index bb7ddb1..ad43359 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -430,7 +430,7 @@ static int mvebu_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	*map = kmalloc(nmaps * sizeof(struct pinctrl_map), GFP_KERNEL);
-	if (map = NULL) {
+	if (*map = NULL) {
 		dev_err(pctl->dev,
 			"cannot allocate pinctrl_map memory for %s\n",
 			np->name);
