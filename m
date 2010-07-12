From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 12 Jul 2010 14:48:24 +0000
Subject: [PATCH] Staging: panel: fix memory leak
Message-Id: <1278946104-30300-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Willy Tarreau <w@1wt.eu>, Peter Huewe <peterhuewe@gmx.de>, Julia Lawall <julia@diku.dk>, Sudhakar Rajashekhara <sudhakar.raj@ti.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

panel_bind_key() must free allocated memory.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/panel/panel.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
index 3154ffe..0fa910d 100644
--- a/drivers/staging/panel/panel.c
+++ b/drivers/staging/panel/panel.c
@@ -1999,8 +1999,10 @@ static struct logical_input *panel_bind_key(char *name, char *press,
 		return NULL;
 	}
 	if (!input_name2mask(name, &key->mask, &key->value, &scan_mask_i,
-			     &scan_mask_o))
+			     &scan_mask_o)) {
+		kfree(key);
 		return NULL;
+	}
 
 	key->type = INPUT_TYPE_KBD;
 	key->state = INPUT_ST_LOW;
-- 
1.7.0.4

