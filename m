From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 21:30:47 +0000
Subject: [PATCH] mfd: tqmx86: Fix a typo in MODULE_DESCRIPTION
Message-Id: <20200412213047.4827-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org, andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Based on the file name and code of the driver, it is likely that this
module is related to TQMx86 and not TQx86.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/tqmx86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index b9f48e588d95..ddddf08b6a4c 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -274,7 +274,7 @@ static int __init tqmx86_init(void)
 
 module_init(tqmx86_init);
 
-MODULE_DESCRIPTION("TQx86 PLD Core Driver");
+MODULE_DESCRIPTION("TQMx86 PLD Core Driver");
 MODULE_AUTHOR("Andrew Lunn <andrew@lunn.ch>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:tqmx86");
-- 
2.20.1
