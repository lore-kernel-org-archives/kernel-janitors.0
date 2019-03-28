From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:40:22 +0000
Subject: [PATCH] pinctrl: imx: remove an unnecessary NULL check
Message-Id: <20190328144022.GO32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The address of "ipctl->pin_regs[pin_id]" can't be NULL.  It's the offset
into an array in the middle of a struct.  This patch removes the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 188001beb298..d2d4b8ffc08d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -449,7 +449,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 		}
 	} else {
 		pin_reg = &ipctl->pin_regs[pin_id];
-		if (!pin_reg || pin_reg->conf_reg = -1) {
+		if (pin_reg->conf_reg = -1) {
 			seq_puts(s, "N/A");
 			return;
 		}
-- 
2.17.1
