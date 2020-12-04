From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:36:35 +0000
Subject: [PATCH] Input: fix spelling mistake "theses" -> "these" in Kconfig
Message-Id: <20201204193635.1152241-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index d8b6a5dab190..63c9cda555c3 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -372,7 +372,7 @@ config MOUSE_VSXXXAA
 	select SERIO
 	help
 	  Say Y (or M) if you want to use a DEC VSXXX-AA (hockey
-	  puck) or a VSXXX-GA (rectangular) mouse. Theses mice are
+	  puck) or a VSXXX-GA (rectangular) mouse. These mice are
 	  typically used on DECstations or VAXstations, but can also
 	  be used on any box capable of RS232 (with some adaptor
 	  described in the source file). This driver also works with the
-- 
2.29.2
