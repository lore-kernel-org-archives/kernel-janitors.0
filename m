From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 07 Jul 2012 18:53:25 +0000
Subject: [PATCH] lirc: fix non-ANSI function declaration warning
Message-Id: <1341687205-21963-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jarod@wilsonet.com, mchehab@infradead.org, gregkh@linuxfoundation.org, rusty@rustcorp.com.au, davej@redhat.com
Cc: linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

Sparse is warning about non-ANSI function declaration.
Add void to the parameterless function.

drivers/staging/media/lirc/lirc_bt829.c:174:22: warning:
	non-ANSI function declaration of function 'poll_main'

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/media/lirc/lirc_bt829.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/lirc/lirc_bt829.c b/drivers/staging/media/lirc/lirc_bt829.c
index 4d20e9f..951007a 100644
--- a/drivers/staging/media/lirc/lirc_bt829.c
+++ b/drivers/staging/media/lirc/lirc_bt829.c
@@ -171,7 +171,7 @@ static void cycle_delay(int cycle)
 }
 
 
-static int poll_main()
+static int poll_main(void)
 {
 	unsigned char status_high, status_low;
 
-- 
1.7.10.4

