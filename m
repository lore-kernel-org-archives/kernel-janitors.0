From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 29 Jul 2010 10:44:26 +0000
Subject: [PATCH 01/10 v2] arm: leds: check return value of request_region()
Message-Id: <1280400267-4659-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

request_region() may fail, if so return -EBUSY.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/arm/mach-shark/leds.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-shark/leds.c b/arch/arm/mach-shark/leds.c
index c9e32de..cb1a8f2 100644
--- a/arch/arm/mach-shark/leds.c
+++ b/arch/arm/mach-shark/leds.c
@@ -155,7 +155,8 @@ static int __init leds_init(void)
 	leds_event = sequoia_leds_event;
 
 	/* Make LEDs independent of power-state */
-	request_region(0x24,4,"sequoia");
+	if (request_region(0x24, 4, "sequoia") = NULL)
+		return -EBUSY;
 	temp = sequoia_read(0x09);
 	temp |= 1<<10;
 	sequoia_write(temp,0x09);
-- 
1.7.0.4

