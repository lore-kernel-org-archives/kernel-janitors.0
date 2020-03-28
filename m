From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 28 Mar 2020 14:43:06 +0000
Subject: [PATCH] MAINTAINERS: clarify maintenance of Gemini SoC driver
Message-Id: <20200328144306.574-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328134304.7317-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200328134304.7317-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Commit 68198dca4569 ("soc: Add SoC driver for Gemini") introduced a Gemini
SoC driver, but did not add the driver to the existing ARM/CORTINA SYSTEMS
GEMINI ARM ARCHITECTURE entry in MAINTAINERS.

Hence, this driver was considered to be part of "THE REST".

Clarify now that this driver is maintained by the ARM/CORTINA SYSTEMS
GEMINI ARM ARCHITECTURE maintainers.

This was identified with a small script that finds all files only
belonging to "THE REST" according to the current MAINTAINERS file, and I
acted upon its output.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20200327

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b8abe756ae0..ae02568afa25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1729,6 +1729,7 @@ F:	arch/arm/mach-gemini/
 F:	drivers/net/ethernet/cortina/
 F:	drivers/pinctrl/pinctrl-gemini.c
 F:	drivers/rtc/rtc-ftrtc010.c
+F:	drivers/soc/gemini/
 
 ARM/CSR SIRFPRIMA2 MACHINE SUPPORT
 M:	Barry Song <baohua@kernel.org>
-- 
2.17.1
