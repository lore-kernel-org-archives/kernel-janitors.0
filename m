From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:20 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 9/16] ifdefs:
Message-Id: <20040508233820.GA4130@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46449062799374319=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46449062799374319==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Introduced a BUG_ON, just in case the comment is wrong, i hope that's fine.


--- c/drivers/scsi/aic7xxx/aic7xxx_osm.c	2004-04-04 05:36:17.000000000 +0200
+++ a/drivers/scsi/aic7xxx/aic7xxx_osm.c	2004-05-08 23:07:21.000000000 +0200
@@ -129,10 +129,7 @@
  */
 #include "aiclib.c"
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 #include <linux/init.h>		/* __setup */
-#endif
-
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 #include "sd.h"			/* For geometry detection */
@@ -151,14 +148,6 @@
 u_int ahc_linux_nseg;
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
-struct proc_dir_entry proc_scsi_aic7xxx = {
-	PROC_SCSI_AIC7XXX, 7, "aic7xxx",
-	S_IFDIR | S_IRUGO | S_IXUGO, 2,
-	0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL
-};
-#endif
-
 /*
  * Set this to the delay in seconds after SCSI bus reset.
  * Note, we honor this only for the initial bus reset.
@@ -592,14 +581,7 @@
 static __inline void
 ahc_schedule_runq(struct ahc_softc *ahc)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	tasklet_schedule(&ahc->platform_data->runq_tasklet);
-#else
-	/*
-	 * Tasklets are not available, so run inline.
-	 */
-	ahc_runq_tasklet((unsigned long)ahc);
-#endif
 }
 
 static __inline struct ahc_linux_device*
@@ -879,11 +861,7 @@
 "aic7xxx: insmod or else it might trash certain memory areas.\n");
 #endif
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,3,0)
 	template->proc_name = "aic7xxx";
-#else
-	template->proc_dir = &proc_scsi_aic7xxx;
-#endif
 
 	/*
 	 * Initialize our softc list lock prior to
@@ -1328,28 +1306,20 @@
 {
 	struct ahc_softc* ahc;
 	struct ahc_linux_device *dev;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	u_long flags;
-#endif
 
 	ahc = (struct ahc_softc *)data;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	ahc_lock(ahc, &flags);
-#endif
 	while ((dev = ahc_linux_next_device_to_run(ahc)) != NULL) {
 	
 		TAILQ_REMOVE(&ahc->platform_data->device_runq, dev, links);
 		dev->flags &= ~AHC_DEV_ON_RUN_LIST;
 		ahc_linux_check_device_queue(ahc, dev);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 		/* Yeild to our interrupt handler */
 		ahc_unlock(ahc, &flags);
 		ahc_lock(ahc, &flags);
-#endif
 	}
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	ahc_unlock(ahc, &flags);
-#endif
 }
 
 /******************************** Macros **************************************/
@@ -1399,7 +1369,6 @@
 {
 	bus_dmamap_t map;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	map = malloc(sizeof(*map), M_DEVBUF, M_NOWAIT);
 	if (map == NULL)
 		return (ENOMEM);
@@ -1423,16 +1392,6 @@
 			printk(KERN_WARNING "aic7xxx: No suitable DMA available.\n");
 			return (ENODEV);
 		}
-#else /* LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0) */
-	/*
-	 * At least in 2.2.14, malloc is a slab allocator so all
-	 * allocations are aligned.  We assume for these kernel versions
-	 * that all allocations will be bellow 4Gig, physically contiguous,
-	 * and accessible via DMA by the controller.
-	 */
-	map = NULL; /* No additional information to store */
-	*vaddr = malloc(dmat->maxsize, M_DEVBUF, M_NOWAIT);
-#endif
 	if (*vaddr == NULL)
 		return (ENOMEM);
 	*mapp = map;
@@ -1443,12 +1402,8 @@
 ahc_dmamem_free(struct ahc_softc *ahc, bus_dma_tag_t dmat,
 		void* vaddr, bus_dmamap_t map)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	pci_free_consistent(ahc->dev_softc, dmat->maxsize,
 			    vaddr, map->bus_addr);
-#else
-	free(vaddr, M_DEVBUF);
-#endif
 }
 
 int
@@ -1462,12 +1417,7 @@
 	 */
 	bus_dma_segment_t stack_sg;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	stack_sg.ds_addr = map->bus_addr;
-#else
-#define VIRT_TO_BUS(a) (uint32_t)virt_to_bus((void *)(a))
-	stack_sg.ds_addr = VIRT_TO_BUS(buf);
-#endif
 	stack_sg.ds_len = dmat->maxsize;
 	cb(cb_arg, &stack_sg, /*nseg*/1, /*error*/0);
 	return (0);
@@ -1478,9 +1428,10 @@
 {
 	/*
 	 * The map may is NULL in our < 2.3.X implementation.
+	 * Now it's 2.6.5, but just in case...
 	 */
-	if (map != NULL)
-		free(map, M_DEVBUF);
+	BUG_ON(map == NULL);
+	free(map, M_DEVBUF);
 }
 
 int
@@ -1694,9 +1645,7 @@
 	return 1;
 }
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,3,0)
 __setup("aic7xxx=", aic7xxx_setup);
-#endif
 
 uint32_t aic7xxx_verbose;
 
@@ -1739,8 +1688,7 @@
 		ahc_set_name(ahc, new_name);
 	}
 	host->unique_id = ahc->unit;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,4) && \
-    LINUX_VERSION_CODE  < KERNEL_VERSION(2,5,0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 	scsi_set_pci_device(host, ahc->dev_softc);
 #endif
 	ahc_linux_initialize_scsi_bus(ahc);
@@ -1926,19 +1874,11 @@
 	ahc->platform_data->completeq_timer.data = (u_long)ahc;
 	ahc->platform_data->completeq_timer.function =
 	    (ahc_linux_callback_t *)ahc_linux_thread_run_complete_queue;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	init_MUTEX_LOCKED(&ahc->platform_data->eh_sem);
 	init_MUTEX_LOCKED(&ahc->platform_data->dv_sem);
 	init_MUTEX_LOCKED(&ahc->platform_data->dv_cmd_sem);
-#else
-	ahc->platform_data->eh_sem = MUTEX_LOCKED;
-	ahc->platform_data->dv_sem = MUTEX_LOCKED;
-	ahc->platform_data->dv_cmd_sem = MUTEX_LOCKED;
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	tasklet_init(&ahc->platform_data->runq_tasklet, ahc_runq_tasklet,
 		     (unsigned long)ahc);
-#endif
 	ahc->seltime = (aic7xxx_seltime & 0x3) << 4;
 	ahc->seltime_b = (aic7xxx_seltime & 0x3) << 4;
 	if (aic7xxx_pci_parity == 0)
@@ -1957,9 +1897,7 @@
 	if (ahc->platform_data != NULL) {
 		del_timer_sync(&ahc->platform_data->completeq_timer);
 		ahc_linux_kill_dv_thread(ahc);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 		tasklet_kill(&ahc->platform_data->runq_tasklet);
-#endif
 		if (ahc->platform_data->host != NULL) {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 			scsi_remove_host(ahc->platform_data->host);
@@ -2000,13 +1938,10 @@
 			base_addr = (u_long)ahc->bsh.maddr;
 			base_addr &= PAGE_MASK;
 			iounmap((void *)base_addr);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 			release_mem_region(ahc->platform_data->mem_busaddr,
 					   0x1000);
-#endif
 		}
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0) && \
-    LINUX_VERSION_CODE  < KERNEL_VERSION(2,5,0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 		/*
 		 * In 2.4 we detach from the scsi midlayer before the PCI
 		 * layer invokes our remove callback.  No per-instance
@@ -4058,7 +3993,7 @@
 		WARN_ON(lun != CAM_LUN_WILDCARD);
 		scsi_report_device_reset(ahc->platform_data->host,
 					 channel - 'A', target);
-#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
+#else
 		Scsi_Device *scsi_dev;
 
 		/*
@@ -4079,12 +4014,10 @@
 		break;
 	}
         case AC_BUS_RESET:
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 		if (ahc->platform_data->host != NULL) {
 			scsi_report_bus_reset(ahc->platform_data->host,
 					      channel - 'A');
 		}
-#endif
                 break;
         default:
                 panic("ahc_send_async: Unexpected async event");

--===============46449062799374319==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46449062799374319==--
