From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 17:36:55 +0000
Subject: [PATCH] input: sidewinder: make array seq static const, makes object smaller
Message-Id: <20190905173655.5621-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array seq on the stack but instead make it
static const. Makes the object code smaller by 30 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  22284	   3184	      0	  25468	   637c	drivers/input/joystick/sidewinder.o

After:
   text	   data	    bss	    dec	    hex	filename
  22158	   3280	      0	  25438	   635e	drivers/input/joystick/sidewinder.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/joystick/sidewinder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 0284da874a2b..1777e68c9f02 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -223,7 +223,7 @@ static __u64 sw_get_bits(unsigned char *buf, int pos, int num, char bits)
 
 static void sw_init_digital(struct gameport *gameport)
 {
-	int seq[] = { 140, 140+725, 140+300, 0 };
+	static const int seq[] = { 140, 140+725, 140+300, 0 };
 	unsigned long flags;
 	int i, t;
 
-- 
2.20.1
