From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Jun 2018 17:08:06 +0000
Subject: [PATCH] w1: ds2482: make module parameter extra_config static
Message-Id: <20180621170806.29505-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Andrew Worsley <amworsley@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable extra_config is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'extra_config' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/w1/masters/ds2482.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 5b3e017d9276..8b5e598ffdb3 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -71,7 +71,7 @@ MODULE_PARM_DESC(active_pullup, "Active pullup (apply to all buses): " \
 #define DS2482_REG_CFG_APU		0x01	/* active pull-up */
 
 /* extra configurations - e.g. 1WS */
-int extra_config;
+static int extra_config;
 
 /**
  * Write and verify codes for the CHANNEL_SELECT command (DS2482-800 only).
-- 
2.17.0

