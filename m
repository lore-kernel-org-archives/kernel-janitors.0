From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:26 +0000
Subject: [KJ] [PATCH 09/20] Fix "nocast type" warnings
Message-Id: <200507102319.26284.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/pnp/pnpacpi

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/pnp/pnpacpi/core.c    |    4 ++--
 drivers/pnp/pnpacpi/pnpacpi.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Index: linux-git/drivers/pnp/pnpacpi/core.c
=================================--- linux-git.orig/drivers/pnp/pnpacpi/core.c	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/pnp/pnpacpi/core.c	2005-07-10 22:43:10.000000000 +0000
@@ -41,9 +41,9 @@
 	return (!acpi_match_ids(dev, excluded_id_list));
 }
 
-void *pnpacpi_kmalloc(size_t size, int f)
+void *pnpacpi_kmalloc(size_t size, unsigned int __nocast flags)
 {
-	void *p = kmalloc(size, f);
+	void *p = kmalloc(size, flags);
 	if (p)
 		memset(p, 0, size);
 	return p;
Index: linux-git/drivers/pnp/pnpacpi/pnpacpi.h
=================================--- linux-git.orig/drivers/pnp/pnpacpi/pnpacpi.h	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/pnp/pnpacpi/pnpacpi.h	2005-07-10 22:43:10.000000000 +0000
@@ -5,7 +5,7 @@
 #include <linux/acpi.h>
 #include <linux/pnp.h>
 
-void *pnpacpi_kmalloc(size_t size, int f);
+void *pnpacpi_kmalloc(size_t size, unsigned int __nocast flags);
 acpi_status pnpacpi_parse_allocated_resource(acpi_handle, struct pnp_resource_table*);
 acpi_status pnpacpi_parse_resource_option_data(acpi_handle, struct pnp_dev*);
 int pnpacpi_encode_resources(struct pnp_resource_table *, struct acpi_buffer *);

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
