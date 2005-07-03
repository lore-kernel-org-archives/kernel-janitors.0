From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:50:57 +0000
Subject: [KJ] [PATCH 2.6.13-c1 4/17] fix sparse warnings (__nocast type)
Message-Id: <200507031850.57491.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_RODyC5+tgV6qcAH"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_RODyC5+tgV6qcAH
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/pnp/pnpacpi

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_RODyC5+tgV6qcAH
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="pnp_pnpacpi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pnp_pnpacpi.patch"

 drivers/pnp/pnpacpi/core.c    |    4 ++--
 drivers/pnp/pnpacpi/pnpacpi.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Index: linux-2.6-git/drivers/pnp/pnpacpi/core.c
===================================================================
--- linux-2.6-git.orig/drivers/pnp/pnpacpi/core.c	2005-07-03 15:40:59.000000000 +0000
+++ linux-2.6-git/drivers/pnp/pnpacpi/core.c	2005-07-03 16:52:12.000000000 +0000
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
Index: linux-2.6-git/drivers/pnp/pnpacpi/pnpacpi.h
===================================================================
--- linux-2.6-git.orig/drivers/pnp/pnpacpi/pnpacpi.h	2005-07-01 17:48:32.000000000 +0000
+++ linux-2.6-git/drivers/pnp/pnpacpi/pnpacpi.h	2005-07-03 16:52:03.000000000 +0000
@@ -5,7 +5,7 @@
 #include <linux/acpi.h>
 #include <linux/pnp.h>
 
-void *pnpacpi_kmalloc(size_t size, int f);
+void *pnpacpi_kmalloc(size_t size, unsigned int __nocast flags);
 acpi_status pnpacpi_parse_allocated_resource(acpi_handle, struct pnp_resource_table*);
 acpi_status pnpacpi_parse_resource_option_data(acpi_handle, struct pnp_dev*);
 int pnpacpi_encode_resources(struct pnp_resource_table *, struct acpi_buffer *);

--Boundary-00=_RODyC5+tgV6qcAH
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_RODyC5+tgV6qcAH--
