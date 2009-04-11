From: Mateusz Mandera <ormi.linux@gmail.com>
Date: Sat, 11 Apr 2009 12:55:22 +0000
Subject: [PATCH]8390p: Get rid of init_module/cleanup_module
Message-Id: <667b0cb60904110555k442f3959k9140d355b00980cd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, p_gortmaker@yahoo.com, trivial@kernel.org

This trivial patch just "gets rid of" init_module and cleanup_module
from drivers/net/8390p.c

Signed-off-by: Mateusz Mandera <ormi.linux@gmail.com>
---
diff --git a/drivers/net/8390p.c b/drivers/net/8390p.c
index da863c9..ec9e3ca 100644
--- a/drivers/net/8390p.c
+++ b/drivers/net/8390p.c
@@ -97,16 +97,15 @@ void NS8390p_init(struct net_device *dev, int startp)
 }
 EXPORT_SYMBOL(NS8390p_init);

-#if defined(MODULE)
-
-int init_module(void)
+static int __init 8390p_init_module(void)
 {
 	return 0;
 }

-void cleanup_module(void)
+static void __exit 8390p_cleanup_module(void)
 {
 }

-#endif /* MODULE */
+module_init(8390p_init_module);
+module_exit(8390p_cleanup_module);
 MODULE_LICENSE("GPL");
