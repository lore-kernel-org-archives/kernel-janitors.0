From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Oct 2019 08:22:05 +0000
Subject: [PATCH][next] staging: wfx: fix spelling mistake "hexdecimal" -> "hexadecimal"
Message-Id: <20191008082205.19740-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the documentation and a module parameter
description. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../devicetree/bindings/net/wireless/siliabs,wfx.txt            | 2 +-
 drivers/staging/wfx/main.c                                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
index 15965c9b4180..26de6762b942 100644
--- a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
+++ b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
@@ -89,7 +89,7 @@ Some properties are recognized either by SPI and SDIO versions:
    this property, driver will disable most of power saving features.
  - config-file: Use an alternative file as PDS. Default is `wf200.pds`. Only
    necessary for development/debug purpose.
- - slk_key: String representing hexdecimal value of secure link key to use.
+ - slk_key: String representing hexadecimal value of secure link key to use.
    Must contains 64 hexadecimal digits. Not supported in current version.
 
 WFx driver also supports `mac-address` and `local-mac-address` as described in
diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index fe9a89703897..d2508bc950fa 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -48,7 +48,7 @@ MODULE_PARM_DESC(gpio_wakeup, "gpio number for wakeup. -1 for none.");
 
 static char *slk_key;
 module_param(slk_key, charp, 0600);
-MODULE_PARM_DESC(slk_key, "secret key for secure link (expect 64 hexdecimal digits).");
+MODULE_PARM_DESC(slk_key, "secret key for secure link (expect 64 hexadecimal digits).");
 
 #define RATETAB_ENT(_rate, _rateid, _flags) { \
 	.bitrate  = (_rate),   \
-- 
2.20.1
