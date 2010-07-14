From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:02:21 +0000
Subject: [PATCH 04/11] xtavnet/setup.c: formatting of pointers in printk()
Message-Id: <1279130541-10817-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Chris Zankel <chris@zankel.net>, Pete Delaney <piet@tensilica.com>, Dan Nicolaescu <dann@xtensa-linux.org>, Marc Gauthier <marc@tensilica.com>, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/xtensa/platforms/xtavnet/setup.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/xtensa/platforms/xtavnet/setup.c b/arch/xtensa/platforms/xtavnet/setup.c
index 256fcb2..1597dbf 100644
--- a/arch/xtensa/platforms/xtavnet/setup.c
+++ b/arch/xtensa/platforms/xtavnet/setup.c
@@ -213,7 +213,7 @@ void platform_init(bp_tag_t *bootparams)
 {
 	printk("\n");
 	if( bootparams )
-		printk("XTAVnet: platform_init(bootparams:0x%x)\n", (unsigned)bootparams);
+		printk("XTAVnet: platform_init(bootparams:%p)\n", bootparams);
 }
 
 static int xtavnet_init(void)
-- 
1.7.0.4

