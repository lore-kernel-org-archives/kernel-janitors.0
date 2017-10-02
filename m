From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Oct 2017 20:40:44 +0000
Subject: [PATCH 2/2] ARM: s3c64xx: Delete an unnecessary return statement in samsung_bl_set()
Message-Id: <6d599b4d-93e3-3e3e-875a-f24ee879ca74@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
In-Reply-To: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 22:30:55 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c64xx/dev-backlight.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/dev-backlight.c b/arch/arm/mach-s3c64xx/dev-backlight.c
index 7e2db762c442..7ef8b9019344 100644
--- a/arch/arm/mach-s3c64xx/dev-backlight.c
+++ b/arch/arm/mach-s3c64xx/dev-backlight.c
@@ -141,5 +141,4 @@ void __init samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
 	kfree(samsung_bl_data);
 err_data:
 	kfree(samsung_bl_device);
-	return;
 }
-- 
2.14.2

