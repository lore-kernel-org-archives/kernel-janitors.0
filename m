From: Jonathan Klee <jklee@nosuchfail.org>
Date: Wed, 03 Sep 2014 15:32:14 +0000
Subject: [PATCH] fix coding style error
Message-Id: <1409758334-32721-1-git-send-email-jklee@nosuchfail.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index f822fd2..df9348f 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -160,7 +160,7 @@ static const struct apple_key_translation swapped_option_cmd_keys[] = {
 	{ KEY_LEFTALT,	KEY_LEFTMETA },
 	{ KEY_LEFTMETA,	KEY_LEFTALT },
 	{ KEY_RIGHTALT,	KEY_RIGHTMETA },
-	{ KEY_RIGHTMETA,KEY_RIGHTALT },
+	{ KEY_RIGHTMETA, KEY_RIGHTALT },
 	{ }
 };
 
-- 
2.1.0

