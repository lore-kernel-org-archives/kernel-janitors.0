From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Wed, 29 Sep 2010 08:34:06 +0000
Subject: [PATCH] Input: i8042 - use unsigned char for 0x90
Message-Id: <1285749246.7370.5.camel@lovely>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>

Keep the file consistent and make clear that we mean 144 instead of -112.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/input/serio/i8042.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index f585131..18db5a8 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1063,7 +1063,7 @@ static long i8042_panic_blink(int state)
 #ifdef CONFIG_X86
 static void i8042_dritek_enable(void)
 {
-	char param = 0x90;
+	unsigned char param = 0x90;
 	int error;
 
 	error = i8042_command(&param, 0x1059);
-- 
1.7.1

