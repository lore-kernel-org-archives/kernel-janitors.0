From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:27 +0000
Subject: [PATCH 18/18] pinctrl: pinconf-generic: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-19-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: benoit.taine@lip6.fr, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Not compile tested, due incompatible architecture.

 drivers/pinctrl/pinconf-generic.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 3d9a999..2457ca9 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -228,13 +228,12 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	 * Now limit the number of configs to the real number of
 	 * found properties.
 	 */
-	*configs = kzalloc(ncfg * sizeof(unsigned long), GFP_KERNEL);
+	*configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
 	if (!*configs) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	memcpy(*configs, cfg, ncfg * sizeof(unsigned long));
 	*nconfigs = ncfg;
 
 out:

