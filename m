From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:22 +0000
Subject: [KJ] [PATCH 15/20] Fix "nocast type" warnings
Message-Id: <200507102320.22602.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/usb/core

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/usb/core/buffer.c  |    4 ++--
 drivers/usb/core/hcd.h     |    2 +-
 drivers/usb/core/message.c |    2 +-
 drivers/usb/core/urb.c     |    2 +-
 include/linux/usb.h        |    4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

Index: linux-git/drivers/usb/core/urb.c
=================================--- linux-git.orig/drivers/usb/core/urb.c	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/usb/core/urb.c	2005-07-10 22:42:53.000000000 +0000
@@ -60,7 +60,7 @@
  *
  * The driver must call usb_free_urb() when it is finished with the urb.
  */
-struct urb *usb_alloc_urb(int iso_packets, int mem_flags)
+struct urb *usb_alloc_urb(int iso_packets, unsigned int __nocast mem_flags)
 {
 	struct urb *urb;
 
Index: linux-git/include/linux/usb.h
=================================--- linux-git.orig/include/linux/usb.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/usb.h	2005-07-10 22:42:53.000000000 +0000
@@ -938,7 +938,7 @@
 }
 
 extern void usb_init_urb(struct urb *urb);
-extern struct urb *usb_alloc_urb(int iso_packets, int mem_flags);
+extern struct urb *usb_alloc_urb(int iso_packets, unsigned int __nocast mem_flags);
 extern void usb_free_urb(struct urb *urb);
 #define usb_put_urb usb_free_urb
 extern struct urb *usb_get_urb(struct urb *urb);
@@ -1055,7 +1055,7 @@
 	struct scatterlist	*sg,
 	int			nents,
 	size_t			length,
-	int			mem_flags
+	unsigned int __nocast	mem_flags
 );
 void usb_sg_cancel (struct usb_sg_request *io);
 void usb_sg_wait (struct usb_sg_request *io);
Index: linux-git/drivers/usb/core/message.c
=================================--- linux-git.orig/drivers/usb/core/message.c	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/usb/core/message.c	2005-07-10 22:42:53.000000000 +0000
@@ -320,7 +320,7 @@
 	struct scatterlist	*sg,
 	int			nents,
 	size_t			length,
-	int			mem_flags
+	unsigned int __nocast	mem_flags
 )
 {
 	int			i;
Index: linux-git/drivers/usb/core/buffer.c
=================================--- linux-git.orig/drivers/usb/core/buffer.c	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/usb/core/buffer.c	2005-07-10 22:42:53.000000000 +0000
@@ -106,7 +106,7 @@
 void *hcd_buffer_alloc (
 	struct usb_bus 		*bus,
 	size_t			size,
-	int			mem_flags,
+	unsigned int __nocast	mem_flags,
 	dma_addr_t		*dma
 )
 {
@@ -123,7 +123,7 @@
 		if (size <= pool_max [i])
 			return dma_pool_alloc (hcd->pool [i], mem_flags, dma);
 	}
-	return dma_alloc_coherent (hcd->self.controller, size, dma, 0);
+	return dma_alloc_coherent (hcd->self.controller, size, dma, 0u);
 }
 
 void hcd_buffer_free (
Index: linux-git/drivers/usb/core/hcd.h
=================================--- linux-git.orig/drivers/usb/core/hcd.h	2005-07-08 12:06:56.000000000 +0000
+++ linux-git/drivers/usb/core/hcd.h	2005-07-10 22:42:53.000000000 +0000
@@ -247,7 +247,7 @@
 void hcd_buffer_destroy (struct usb_hcd *hcd);
 
 void *hcd_buffer_alloc (struct usb_bus *bus, size_t size,
-	int mem_flags, dma_addr_t *dma);
+			unsigned int __nocast mem_flags, dma_addr_t *dma);
 void hcd_buffer_free (struct usb_bus *bus, size_t size,
 	void *addr, dma_addr_t dma);
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
