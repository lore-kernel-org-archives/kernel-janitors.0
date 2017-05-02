From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 09:27:14 +0000
Subject: [PATCH 7/9] pinctrl: Add spaces for better code readability
Message-Id: <9c9c3bf8-f8c2-955b-934d-535b09d988f7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 10:32:19 +0200

The script "checkpatch.pl" pointed information out like the following.

CHECK: spaces preferred around that '+' (ctx:VxV)

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 037ac3e47891..14a8644ad6b0 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -395,9 +395,9 @@ static const struct file_operations pinconf_groups_ops = {
 
 struct dbg_cfg {
 	enum pinctrl_map_type map_type;
-	char dev_name[MAX_NAME_LEN+1];
-	char state_name[MAX_NAME_LEN+1];
-	char pin_name[MAX_NAME_LEN+1];
+	char dev_name[MAX_NAME_LEN + 1];
+	char state_name[MAX_NAME_LEN + 1];
+	char pin_name[MAX_NAME_LEN + 1];
 };
 
 /*
@@ -486,7 +486,7 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 	const struct pinconf_ops *confops = NULL;
 	struct dbg_cfg *dbg = &pinconf_dbg_conf;
 	const struct pinctrl_map_configs *configs;
-	char config[MAX_NAME_LEN+1];
+	char config[MAX_NAME_LEN + 1];
 	char buf[128];
 	char *b = &buf[0];
 	int buf_size;
-- 
2.12.2

