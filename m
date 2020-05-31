From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 31 May 2020 09:34:29 +0000
Subject: [PATCH] ARM: riscpc: mark a function as __init to save some memory
Message-Id: <20200531093429.596642-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'ecard_bus_init()' is only called via 'postcore_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-rpc/ecard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-rpc/ecard.c b/arch/arm/mach-rpc/ecard.c
index 75cfad2cb143..9f4e7106efb9 100644
--- a/arch/arm/mach-rpc/ecard.c
+++ b/arch/arm/mach-rpc/ecard.c
@@ -1135,7 +1135,7 @@ struct bus_type ecard_bus_type = {
 	.shutdown	= ecard_drv_shutdown,
 };
 
-static int ecard_bus_init(void)
+static int __init ecard_bus_init(void)
 {
 	return bus_register(&ecard_bus_type);
 }
-- 
2.25.1
