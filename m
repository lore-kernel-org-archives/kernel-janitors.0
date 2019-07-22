From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 22 Jul 2019 21:36:57 +0000
Subject: [PATCH] ARM: davinci: dm646x: Fix a typo in the comment
Message-Id: <20190722213657.27175-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nsekhar@ti.com, bgolaszewski@baylibre.com, linux@armlinux.org.uk
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The driver is dedicated to DM646x. So update the description in the top
most comment accordingly.

It must have been derived from dm644x.c, but looks DM646 speecific now.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-davinci/dm646x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index 62ca952fe161..4c58510e5792 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -1,5 +1,5 @@
 /*
- * TI DaVinci DM644x chip specific setup
+ * TI DaVinci DM646x chip specific setup
  *
  * Author: Kevin Hilman, Deep Root Systems, LLC
  *
-- 
2.20.1
