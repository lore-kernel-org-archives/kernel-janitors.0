From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 10:58:50 +0000
Subject: [patch] isdn: act200: fix MODULE_PARM_DESC() typo
Message-Id: <20160108105850.GD32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no "membase", it was "act_port" that was intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/act2000/module.c b/drivers/isdn/act2000/module.c
index c3a1b06..68073d0 100644
--- a/drivers/isdn/act2000/module.c
+++ b/drivers/isdn/act2000/module.c
@@ -37,7 +37,7 @@ MODULE_DESCRIPTION("ISDN4Linux: Driver for IBM Active 2000 ISDN card");
 MODULE_AUTHOR("Fritz Elfert");
 MODULE_LICENSE("GPL");
 MODULE_PARM_DESC(act_bus, "BusType of first card, 1=ISA, 2=MCA, 3=PCMCIA, currently only ISA");
-MODULE_PARM_DESC(membase, "Base port address of first card");
+MODULE_PARM_DESC(act_port, "Base port address of first card");
 MODULE_PARM_DESC(act_irq, "IRQ of first card");
 MODULE_PARM_DESC(act_id, "ID-String of first card");
 module_param(act_bus, int, 0);
