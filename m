From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:34 +0000
Subject: [KJ] [PATCH 10/20] Fix "nocast type" warnings
Message-Id: <200507102319.34713.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/pnp/pnpbios

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/pnp/pnpbios/core.c    |    4 ++--
 drivers/pnp/pnpbios/pnpbios.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Index: linux-git/drivers/pnp/pnpbios/core.c
=================================--- linux-git.orig/drivers/pnp/pnpbios/core.c	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/pnp/pnpbios/core.c	2005-07-10 22:43:10.000000000 +0000
@@ -86,9 +86,9 @@
 
 struct pnp_dev_node_info node_info;
 
-void *pnpbios_kmalloc(size_t size, int f)
+void *pnpbios_kmalloc(size_t size, unsigned int __nocast flags)
 {
-	void *p = kmalloc( size, f );
+	void *p = kmalloc( size, flags );
 	if ( p = NULL )
 		printk(KERN_ERR "PnPBIOS: kmalloc() failed\n");
 	else
Index: linux-git/drivers/pnp/pnpbios/pnpbios.h
=================================--- linux-git.orig/drivers/pnp/pnpbios/pnpbios.h	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/pnp/pnpbios/pnpbios.h	2005-07-10 22:43:10.000000000 +0000
@@ -26,7 +26,7 @@
 
 extern int pnp_bios_present(void);
 extern int  pnpbios_dont_use_current_config;
-extern void *pnpbios_kmalloc(size_t size, int f);
+extern void *pnpbios_kmalloc(size_t size, unsigned int __nocast flags);
 
 extern int pnpbios_parse_data_stream(struct pnp_dev *dev, struct pnp_bios_node * node);
 extern int pnpbios_read_resources_from_node(struct pnp_resource_table *res, struct pnp_bios_node * node);

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
