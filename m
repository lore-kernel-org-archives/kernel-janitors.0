From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 09:57:11 +0000
Subject: [PATCH] Input: Fix a typo in a module name in Kconfig
Message-Id: <20200412095711.9107-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, tglx@linutronix.de
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

A 'y' is missing in spear-keyboard.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 28de965a08d5..793ecbbda32c 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -701,7 +701,7 @@ config KEYBOARD_SPEAR
 	  Say Y here if you want to use the SPEAR keyboard.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called spear-keboard.
+	  module will be called spear-keyboard.
 
 config KEYBOARD_TC3589X
 	tristate "TC3589X Keypad support"
-- 
2.20.1
