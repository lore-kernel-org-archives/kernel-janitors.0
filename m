From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:18 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 6/16] ifdefs:
Message-Id: <20040508233818.GA4112@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61887711024181602=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61887711024181602==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/scsi/aic7xxx/aic79xx_osm.c	2004-04-04 05:37:23.000000000 +0200
+++ a/drivers/scsi/aic7xxx/aic79xx_osm.c	2004-05-09 00:39:19.000000000 +0200
@@ -52,9 +52,7 @@
  */
 #include "aiclib.c"
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 #include <linux/init.h>		/* __setup */
-#endif
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 #include "sd.h"			/* For geometry detection */
@@ -67,14 +65,6 @@
  */
 spinlock_t ahd_list_spinlock;
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
-struct proc_dir_entry proc_scsi_aic79xx = {
-	PROC_SCSI_AIC79XX, 7, "aic79xx",
-	S_IFDIR | S_IRUGO | S_IXUGO, 2,
-	0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL
-};
-#endif
-
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 /* For dynamic sglist size calculation. */
 u_int ahd_linux_nseg;
@@ -584,31 +574,20 @@
 static __inline void
 ahd_schedule_runq(struct ahd_softc *ahd)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	tasklet_schedule(&ahd->platform_data->runq_tasklet);
-#else
-	/*
-	 * Tasklets are not available, so run inline.
-	 */
-	ahd_runq_tasklet((unsigned long)ahd);
-#endif
 }
 
 static __inline
 void ahd_setup_runq_tasklet(struct ahd_softc *ahd)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	tasklet_init(&ahd->platform_data->runq_tasklet, ahd_runq_tasklet,
 		     (unsigned long)ahd);
-#endif
 }
 
 static __inline void
 ahd_teardown_runq_tasklet(struct ahd_softc *ahd)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	tasklet_kill(&ahd->platform_data->runq_tasklet);
-#endif
 }
 
 static __inline struct ahd_linux_device*
@@ -894,11 +873,7 @@
 "aic79xx: insmod or else it might trash certain memory areas.\n");
 #endif
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,3,0)
 	template->proc_name = "aic79xx";
-#else
-	template->proc_dir = &proc_scsi_aic79xx;
-#endif
 
 	/*
 	 * Initialize our softc list lock prior to
@@ -1699,28 +1674,20 @@
 {
 	struct ahd_softc* ahd;
 	struct ahd_linux_device *dev;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	u_long flags;
-#endif
 
 	ahd = (struct ahd_softc *)data;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	ahd_lock(ahd, &flags);
-#endif
 	while ((dev = ahd_linux_next_device_to_run(ahd)) != NULL) {
 	
 		TAILQ_REMOVE(&ahd->platform_data->device_runq, dev, links);
 		dev->flags &= ~AHD_DEV_ON_RUN_LIST;
 		ahd_linux_check_device_queue(ahd, dev);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 		/* Yeild to our interrupt handler */
 		ahd_unlock(ahd, &flags);
 		ahd_lock(ahd, &flags);
-#endif
 	}
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	ahd_unlock(ahd, &flags);
-#endif
 }
 
 /******************************** Bus DMA *************************************/
@@ -1764,7 +1731,6 @@
 {
 	bus_dmamap_t map;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	map = malloc(sizeof(*map), M_DEVBUF, M_NOWAIT);
 	if (map == NULL)
 		return (ENOMEM);
@@ -1788,16 +1754,6 @@
 			printk(KERN_WARNING "aic79xx: No suitable DMA available.\n");
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
@@ -1808,12 +1764,8 @@
 ahd_dmamem_free(struct ahd_softc *ahd, bus_dma_tag_t dmat,
 		void* vaddr, bus_dmamap_t map)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	pci_free_consistent(ahd->dev_softc, dmat->maxsize,
 			    vaddr, map->bus_addr);
-#else
-	free(vaddr, M_DEVBUF);
-#endif
 }
 
 int
@@ -1827,12 +1779,7 @@
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
@@ -2064,9 +2011,7 @@
 	return 1;
 }
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,3,0)
 __setup("aic79xx=", aic79xx_setup);
-#endif
 
 uint32_t aic79xx_verbose;
 
@@ -2109,8 +2054,7 @@
 		ahd_set_name(ahd, new_name);
 	}
 	host->unique_id = ahd->unit;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,4) && \
-    LINUX_VERSION_CODE  < KERNEL_VERSION(2,5,0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 	scsi_set_pci_device(host, ahd->dev_softc);
 #endif
 	ahd_linux_setup_user_rd_strm_settings(ahd);
@@ -2262,15 +2206,9 @@
 	ahd->platform_data->completeq_timer.data = (u_long)ahd;
 	ahd->platform_data->completeq_timer.function =
 	    (ahd_linux_callback_t *)ahd_linux_thread_run_complete_queue;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	init_MUTEX_LOCKED(&ahd->platform_data->eh_sem);
 	init_MUTEX_LOCKED(&ahd->platform_data->dv_sem);
 	init_MUTEX_LOCKED(&ahd->platform_data->dv_cmd_sem);
-#else
-	ahd->platform_data->eh_sem = MUTEX_LOCKED;
-	ahd->platform_data->dv_sem = MUTEX_LOCKED;
-	ahd->platform_data->dv_cmd_sem = MUTEX_LOCKED;
-#endif
 	ahd_setup_runq_tasklet(ahd);
 	ahd->seltime = (aic79xx_seltime & 0x3) << 4;
 	return (0);
@@ -2330,13 +2268,10 @@
 			base_addr = (u_long)ahd->bshs[0].maddr;
 			base_addr &= PAGE_MASK;
 			iounmap((void *)base_addr);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 			release_mem_region(ahd->platform_data->mem_busaddr,
 					   0x1000);
-#endif
 		}
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0) && \
-    LINUX_VERSION_CODE  < KERNEL_VERSION(2,5,0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
     		/*
 		 * In 2.4 we detach from the scsi midlayer before the PCI
 		 * layer invokes our remove callback.  No per-instance
@@ -4370,7 +4305,7 @@
 		WARN_ON(lun != CAM_LUN_WILDCARD);
 		scsi_report_device_reset(ahd->platform_data->host,
 					 channel - 'A', target);
-#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
+#else
 		Scsi_Device *scsi_dev;
 
 		/*
@@ -4391,12 +4326,10 @@
 		break;
 	}
         case AC_BUS_RESET:
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 		if (ahd->platform_data->host != NULL) {
 			scsi_report_bus_reset(ahd->platform_data->host,
 					      channel - 'A');
 		}
-#endif
                 break;
         default:
                 panic("ahd_send_async: Unexpected async event");

--===============61887711024181602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61887711024181602==--
