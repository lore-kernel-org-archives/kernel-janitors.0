From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 18 Nov 2010 18:17:00 +0000
Subject: [PATCH 3/4] leds: leds-lp5521: fix potential buffer overflow
Message-Id: <1290104221-31375-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org

The code doesn't check first sscanf() return value.
If first sscanf() failed then c contains some garbage.
It might lead to buffer overflow in second sscanf() call.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 drivers/leds/leds-lp5521.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 3782f31..939319d 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -362,6 +362,8 @@ static int lp5521_do_store_load(struct lp5521_engine *engine,
 	while ((offset < len - 1) && (i < LP5521_PROGRAM_LENGTH)) {
 		/* separate sscanfs because length is working only for %s */
 		ret = sscanf(buf + offset, "%2s%n ", c, &nrchars);
+		if (ret != 2)
+			goto fail;
 		ret = sscanf(c, "%2x", &cmd);
 		if (ret != 1)
 			goto fail;
-- 
1.7.0.4

