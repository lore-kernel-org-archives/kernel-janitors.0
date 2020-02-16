From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 16 Feb 2020 13:08:41 +0000
Subject: [PATCH] MAINTAINERS: adjust to stm32 timer dt-bindings conversion
Message-Id: <20200216130841.4187-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, Rob Herring <robh@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

The commit 56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings
to json-schema") and commit b88091f5d84a ("dt-bindings: mfd: Convert stm32
low power timers bindings to json-schema") converted some files from txt to
yaml format in ./Documentation/devicetree/bindings/, but they missed to
adjust MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  no file matches F: Documentation/devicetree/bindings/*/stm32-*timer*
  no file matches F: Documentation/devicetree/bindings/pwm/pwm-stm32*

So, repair the MAINTAINERS entry now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Benjamin, Fabrice, please ack.
Rob, please pick this patch.
applies cleanly on current master and on next-20200214

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..9175b59e2b4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15923,8 +15923,7 @@ F:	drivers/*/stm32-*timer*
 F:	drivers/pwm/pwm-stm32*
 F:	include/linux/*/stm32-*tim*
 F:	Documentation/ABI/testing/*timer-stm32
-F:	Documentation/devicetree/bindings/*/stm32-*timer*
-F:	Documentation/devicetree/bindings/pwm/pwm-stm32*
+F:	Documentation/devicetree/bindings/mfd/st,stm32-*timer*.yaml
 
 STMMAC ETHERNET DRIVER
 M:	Giuseppe Cavallaro <peppe.cavallaro@st.com>
-- 
2.17.1
