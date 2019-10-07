From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Oct 2019 14:05:59 +0000
Subject: [PATCH] pinctrl: rzn1: array reg_drive static, makes object smaller
Message-Id: <20191007140559.11840-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array reg_drive on the stack but instead make it
static. Makes the object code smaller by 32 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  31991	  15696	      0	  47687	   ba47	drivers/pinctrl/pinctrl-rzn1.o

After:
   text	   data	    bss	    dec	    hex	filename
  31863	  15792	      0	  47655	   ba27	drivers/pinctrl/pinctrl-rzn1.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index 0f6f8a10a53a..39538d40dbf3 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -487,7 +487,7 @@ static int rzn1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rzn1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
-	const u32 reg_drive[4] = { 4, 6, 8, 12 };
+	static const u32 reg_drive[4] = { 4, 6, 8, 12 };
 	u32 pull, drive, l1mux;
 	u32 l1, l2, arg = 0;
 
-- 
2.20.1
