From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 15:51:06 +0000
Subject: [PATCH] ixp4xx: fix spelling mistake in Kconfig "Devce" -> "Device"
Message-Id: <20201207155106.172057-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is spelling mistake in the prompt text in the Kconfig. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arm/mach-ixp4xx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index f7211b57b1e7..7cf06c4fd8e7 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -7,7 +7,7 @@ comment "IXP4xx Platforms"
 
 config MACH_IXP4XX_OF
 	bool
-	prompt "Devce Tree IXP4xx boards"
+	prompt "Device Tree IXP4xx boards"
 	default y
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select I2C
-- 
2.29.2
