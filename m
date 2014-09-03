From: Jonathan Klee <jklee@nosuchfail.org>
Date: Wed, 03 Sep 2014 14:08:16 +0000
Subject: [PATCH] hid-apple: fix coding style error
Message-Id: <540720D0.2060800@nosuchfail.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010900090809040600070901"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010900090809040600070901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,
please find attached a patch fixing a coding style error.

Regards,
jklee

--------------010900090809040600070901
Content-Type: text/x-patch;
 name="0001-fix-coding-style-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-fix-coding-style-error.patch"

From e66b1e0cb9733ab20a73bb3234578006afd02639 Mon Sep 17 00:00:00 2001
From: "Jonathan Klee (jklee)" <jklee@nosuchfail.org>
Date: Wed, 3 Sep 2014 15:43:13 +0200
Subject: [PATCH] fix coding style error

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


--------------010900090809040600070901--
