From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:20 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 10/16] ifdefs:
Message-Id: <20040508233820.GA4136@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80149247567868143=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80149247567868143==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

KERNEL_VERSION is defined in 2.2.20, so i bet it's also in 2.4.x, remove it.

--- c/drivers/scsi/aic7xxx/aic7xxx_osm.h	2004-04-04 05:36:56.000000000 +0200
+++ a/drivers/scsi/aic7xxx/aic7xxx_osm.h	2004-05-08 23:46:51.000000000 +0200
@@ -70,17 +70,9 @@
 #include <asm/byteorder.h>
 #include <asm/io.h>
 
-#ifndef KERNEL_VERSION
-#define KERNEL_VERSION(x,y,z) (((x)<<16)+((y)<<8)+(z))
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 #include <linux/interrupt.h> /* For tasklet support. */
 #include <linux/config.h>
 #include <linux/slab.h>
-#else
-#include <linux/malloc.h>
-#endif
 
 /* Core SCSI definitions */
 #define AIC_LIB_PREFIX ahc
@@ -156,11 +148,7 @@
 
 /***************************** Bus Space/DMA **********************************/
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,2,17)
 typedef dma_addr_t bus_addr_t;
-#else
-typedef uint32_t bus_addr_t;
-#endif
 typedef uint32_t bus_size_t;
 
 typedef enum {
@@ -292,11 +280,7 @@
 }
 
 /***************************** SMP support ************************************/
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,17)
 #include <linux/spinlock.h>
-#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,1,93)
-#include <linux/smp.h>
-#endif
 
 #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0) || defined(SCSI_HAS_HOST_LOCK))
 #define AHC_SCSI_HAS_HOST_LOCK 1
@@ -517,9 +501,6 @@
 	struct ahc_linux_device	*dev;
 	bus_addr_t		 buf_busaddr;
 	uint32_t		 xfer_len;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
-	uint32_t		 resid;		/* Transfer residual */
-#endif
 	uint32_t		 sense_resid;	/* Auto-Sense residual */
 	ahc_linux_scb_flags	 flags;
 };
@@ -549,9 +530,7 @@
 	struct ahc_completeq	 completeq;
 
 	spinlock_t		 spin_lock;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	struct tasklet_struct	 runq_tasklet;
-#endif
 	u_int			 qfrozen;
 	pid_t			 dv_pid;
 	struct timer_list	 completeq_timer;
@@ -819,9 +798,7 @@
 #define PCIR_SUBVEND_0	0x2c
 #define PCIR_SUBDEV_0	0x2e
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 extern struct pci_driver aic7xxx_pci_driver;
-#endif
 
 typedef enum
 {
@@ -942,25 +919,7 @@
 	ahc_inb(ahc, INTSTAT);
 }
 
-#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,3,0)
-#define pci_map_sg(pdev, sg_list, nseg, direction) (nseg)
-#define pci_unmap_sg(pdev, sg_list, nseg, direction)
-#define sg_dma_address(sg) (VIRT_TO_BUS((sg)->address))
-#define sg_dma_len(sg) ((sg)->length)
-#define pci_map_single(pdev, buffer, bufflen, direction) \
-	(VIRT_TO_BUS(buffer))
-#define pci_unmap_single(pdev, buffer, buflen, direction)
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,3)
 #define ahc_pci_set_dma_mask pci_set_dma_mask
-#else
-/*
- * Always "return" 0 for success.
- */
-#define ahc_pci_set_dma_mask(dev_softc, mask)  			\
-	(((dev_softc)->dma_mask = mask) && 0)
-#endif
 /**************************** Proc FS Support *********************************/
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 int	ahc_linux_proc_info(char *, char **, off_t, int, int, int);
@@ -1068,35 +1027,13 @@
 static __inline
 int ahc_get_transfer_dir(struct scb *scb)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,40)
 	return (scb->io_ctx->sc_data_direction);
-#else
-	if (scb->io_ctx->bufflen == 0)
-		return (CAM_DIR_NONE);
-
-	switch(scb->io_ctx->cmnd[0]) {
-	case 0x08:  /* READ(6)  */
-	case 0x28:  /* READ(10) */
-	case 0xA8:  /* READ(12) */
-		return (CAM_DIR_IN);
-        case 0x0A:  /* WRITE(6)  */
-        case 0x2A:  /* WRITE(10) */
-        case 0xAA:  /* WRITE(12) */
-		return (CAM_DIR_OUT);
-        default:
-		return (CAM_DIR_NONE);
-        }
-#endif
 }
 
 static __inline
 void ahc_set_residual(struct scb *scb, u_long resid)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	scb->io_ctx->resid = resid;
-#else
-	scb->platform_data->resid = resid;
-#endif
 }
 
 static __inline
@@ -1108,11 +1045,7 @@
 static __inline
 u_long ahc_get_residual(struct scb *scb)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	return (scb->io_ctx->resid);
-#else
-	return (scb->platform_data->resid);
-#endif
 }
 
 static __inline

--===============80149247567868143==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80149247567868143==--
