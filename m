From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:16:42 +0000
Subject: [PATCH 79] arch/i386/mach-voyager/voyager_cat.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010016.42984.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, J.E.J.Bottomley@hansenpartnership.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 arch/i386/mach-voyager/voyager_cat.c | 35688 -> 35576 (-112 bytes)
 arch/i386/mach-voyager/voyager_cat.o | 151452 -> 150992 (-460 bytes)

 arch/i386/mach-voyager/voyager_cat.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

--- linux-2.6.23-rc1-mm1-a/arch/i386/mach-voyager/voyager_cat.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/arch/i386/mach-voyager/voyager_cat.c	2007-07-31 12:51:54.000000000 +0200
@@ -648,20 +648,18 @@ voyager_cat_init(void)
 		}
 		CDEBUG(("VOYAGER DEBUG: found module id 0x%x, %s\n", i,
 			cat_module_name(i)));
-		*modpp = kmalloc(sizeof(voyager_module_t), GFP_KERNEL); /*&voyager_module_storage[cat_count++];*/
-		if(*modpp = NULL) {
+		*modpp = kzalloc(sizeof(voyager_module_t), GFP_KERNEL); /*&voyager_module_storage[cat_count++];*/
+		if (!*modpp) {
 			printk("**WARNING** kmalloc failure in cat_init\n");
 			continue;
 		}
-		memset(*modpp, 0, sizeof(voyager_module_t));
 		/* need temporary asic for cat_subread.  It will be
 		 * filled in correctly later */
-		(*modpp)->asic = kmalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count];*/
-		if((*modpp)->asic = NULL) {
+		(*modpp)->asic = kzalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count];*/
+		if (!(*modpp)->asic) {
 			printk("**WARNING** kmalloc failure in cat_init\n");
 			continue;
 		}
-		memset((*modpp)->asic, 0, sizeof(voyager_asic_t));
 		(*modpp)->asic->asic_id = VOYAGER_CAT_ID;
 		(*modpp)->asic->subaddr = VOYAGER_SUBADDR_HI;
 		(*modpp)->module_addr = i;
