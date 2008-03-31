From: Andrey Valyaev <dron@infosec.ru>
Date: Mon, 31 Mar 2008 14:03:19 +0000
Subject: [PATCH] Remove empty function from arch/arm/mach-pxa/trizeps4.c
Message-Id: <200803311803.19734.dron@infosec.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove empty function from arch/arm/mach-pxa/trizeps4.c
It's valid Janitor patch?

 trizeps4.c |    6 ------
 1 file changed, 6 deletions(-)

========
diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
index f207fcd..5df658f 100644
--- a/arch/arm/mach-pxa/trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4.c
@@ -333,15 +333,9 @@ static int trizeps4_ohci_init(struct device *dev)
        return 0;
 }

-static void trizeps4_ohci_exit(struct device *dev)
-{
-       ;
-}
-
 static struct pxaohci_platform_data trizeps4_ohci_platform_data = {
        .port_mode      = PMM_PERPORT_MODE,
        .init           = trizeps4_ohci_init,
-       .exit           = trizeps4_ohci_exit,
 };

 static struct map_desc trizeps4_io_desc[] __initdata = {
========

-- 

	Andrey Valyaev <dron@infosec.ru>
