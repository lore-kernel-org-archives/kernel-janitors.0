From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Dec 2020 17:13:31 +0000
Subject: [PATCH] ARM: sti: Fix spelling mistake in Kconfig "targetted" -> "targeted"
Message-Id: <20201217171331.57376-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arm/mach-sti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index b2d45cf10a3c..74640bbaeba6 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -50,7 +50,7 @@ config SOC_STIH407
 	select STIH407_RESET
 	help
 	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH407 parts, targetted at set-top-box
+	  Electronics family StiH407 parts, targeted at set-top-box
 	  and other digital audio/video applications using Flattened Device
 	  Trees.
 
-- 
2.29.2
