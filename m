From: James Nelson <james4765@gmail.com>
Date: Sun, 27 Aug 2006 19:03:45 +0000
Subject: [KJ] [PATCH] nsp: remove 2.5-era ifdefs
Message-Id: <20060827190345.14338.8976.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This pulls a lot of 2.5-era #ifdefs out of the Ninja PCMCIA SCSI adapter driver.

Signed-off-by: James Nelson <james4765@gmail.com>
---

diff --git a/drivers/scsi/pcmcia/nsp_cs.c b/drivers/scsi/pcmcia/nsp_cs.c
index 0d4c04e..96a7ec6 100644
--- a/drivers/scsi/pcmcia/nsp_cs.c
+++ b/drivers/scsi/pcmcia/nsp_cs.c
@@ -85,10 +85,6 @@ static struct scsi_host_template nsp_dri
 	.proc_name	         = "nsp_cs",
 	.proc_info		 = nsp_proc_info,
 	.name			 = "WorkBit NinjaSCSI-3/32Bi(16bit)",
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
-	.detect			 = nsp_detect_old,
-	.release		 = nsp_release_old,
-#endif
 	.info			 = nsp_info,
 	.queuecommand		 = nsp_queuecommand,
 /*	.eh_abort_handler	 = nsp_eh_abort,*/
@@ -99,9 +95,6 @@ #endif
 	.sg_tablesize		 = SG_ALL,
 	.cmd_per_lun		 = 1,
 	.use_clustering		 = DISABLE_CLUSTERING,
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,2))
-	.use_new_eh_code	 = 1,
-#endif
 };
 
 static nsp_hw_data nsp_data_base; /* attach <-> detect glue */
@@ -1313,11 +1306,7 @@ static struct Scsi_Host *nsp_detect(stru
 	nsp_hw_data *data_b = &nsp_data_base, *data;
 
 	nsp_dbg(NSP_DEBUG_INIT, "this_id=%d", sht->this_id);
-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
 	host = scsi_host_alloc(&nsp_driver_template, sizeof(nsp_hw_data));
-#else
-	host = scsi_register(sht, sizeof(nsp_hw_data));
-#endif
 	if (host = NULL) {
 		nsp_dbg(NSP_DEBUG_INIT, "host failed");
 		return NULL;
@@ -1354,37 +1343,6 @@ #endif
 	return host; /* detect done. */
 }
 
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
-static int nsp_detect_old(struct scsi_host_template *sht)
-{
-	if (nsp_detect(sht) = NULL) {
-		return 0;
-	} else {
-		//MOD_INC_USE_COUNT;
-		return 1;
-	}
-}
-
-
-static int nsp_release_old(struct Scsi_Host *shpnt)
-{
-	//nsp_hw_data *data = (nsp_hw_data *)shpnt->hostdata;
-
-	/* PCMCIA Card Service dose same things below. */
-	/* So we do nothing.                           */
-	//if (shpnt->irq) {
-	//	free_irq(shpnt->irq, data->ScsiInfo);
-	//}
-	//if (shpnt->io_port) {
-	//	release_region(shpnt->io_port, shpnt->n_io_port);
-	//}
-
-	//MOD_DEC_USE_COUNT;
-
-	return 0;
-}
-#endif
-
 /*----------------------------------------------------------------*/
 /* return info string						  */
 /*----------------------------------------------------------------*/
@@ -1405,16 +1363,11 @@ #define SPRINTF(args...) \
 	} while(0)
 static int
 nsp_proc_info(
-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
 	struct Scsi_Host *host,
-#endif
 	char  *buffer,
 	char **start,
 	off_t  offset,
 	int    length,
-#if !(LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
-	int    hostno,
-#endif
 	int    inout)
 {
 	int id;
@@ -1423,24 +1376,12 @@ #endif
 	int speed;
 	unsigned long flags;
 	nsp_hw_data *data;
-#if !(LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
-	struct Scsi_Host *host;
-#else
 	int hostno;
-#endif
 	if (inout) {
 		return -EINVAL;
 	}
 
-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
 	hostno = host->host_no;
-#else
-	/* search this HBA host */
-	host = scsi_host_hn_get(hostno);
-	if (host = NULL) {
-		return -ESRCH;
-	}
-#endif
 	data = (nsp_hw_data *)host->hostdata;
 
 
@@ -1677,10 +1618,6 @@ static int nsp_cs_config(struct pcmcia_d
 	cistpl_cftable_entry_t dflt = { 0 };
 	struct Scsi_Host *host;
 	nsp_hw_data      *data = &nsp_data_base;
-#if !(LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,74))
-	struct scsi_device	 *dev;
-	dev_node_t	**tail, *node;
-#endif
 
 	nsp_dbg(NSP_DEBUG_INIT, "in");
 
@@ -1819,17 +1756,7 @@ #endif
 		goto cs_failed;
 	}
 
-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,2))
 	host = nsp_detect(&nsp_driver_template);
-#else
-	scsi_register_host(&nsp_driver_template);
-	for (host = scsi_host_get_next(NULL); host != NULL;
-	     host = scsi_host_get_next(host)) {
-		if (host->hostt = &nsp_driver_template) {
-			break;
-		}
-	}
-#endif
 
 	if (host = NULL) {
 		nsp_dbg(NSP_DEBUG_INIT, "detect failed");
@@ -1837,7 +1764,6 @@ #endif
 	}
 
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,74))
 	ret = scsi_add_host (host, NULL);
 	if (ret)
 		goto cs_failed;
@@ -1848,52 +1774,6 @@ #if (LINUX_VERSION_CODE >= KERNEL_VERSIO
 	link->dev_node  = &info->node;
 	info->host = host;
 
-#else
-	nsp_dbg(NSP_DEBUG_INIT, "GET_SCSI_INFO");
-	tail = &link->dev_node;
-	info->ndev = 0;
-
-	nsp_dbg(NSP_DEBUG_INIT, "host=0x%p", host);
-
-	for (dev = host->host_queue; dev != NULL; dev = dev->next) {
-		unsigned long id;
-		id = (dev->id & 0x0f) + ((dev->lun & 0x0f) << 4) +
-			((dev->channel & 0x0f) << 8) +
-			((dev->host->host_no & 0x0f) << 12);
-		node = &info->node[info->ndev];
-		node->minor = 0;
-		switch (dev->type) {
-		case TYPE_TAPE:
-			node->major = SCSI_TAPE_MAJOR;
-			snprintf(node->dev_name, sizeof(node->dev_name), "st#%04lx", id);
-			break;
-		case TYPE_DISK:
-		case TYPE_MOD:
-			node->major = SCSI_DISK0_MAJOR;
-			snprintf(node->dev_name, sizeof(node->dev_name), "sd#%04lx", id);
-			break;
-		case TYPE_ROM:
-		case TYPE_WORM:
-			node->major = SCSI_CDROM_MAJOR;
-			snprintf(node->dev_name, sizeof(node->dev_name), "sr#%04lx", id);
-			break;
-		default:
-			node->major = SCSI_GENERIC_MAJOR;
-			snprintf(node->dev_name, sizeof(node->dev_name), "sg#%04lx", id);
-			break;
-		}
-		*tail = node; tail = &node->next;
-		info->ndev++;
-		info->host = dev->host;
-	}
-
-	*tail = NULL;
-	if (info->ndev = 0) {
-		nsp_msg(KERN_INFO, "no SCSI devices found");
-	}
-	nsp_dbg(NSP_DEBUG_INIT, "host=0x%p", host);
-#endif
-
 	/* Finally, report what we've done */
 	printk(KERN_INFO "nsp_cs: index 0x%02x: ",
 	       link->conf.ConfigIndex);
@@ -1946,13 +1826,9 @@ static void nsp_cs_release(struct pcmcia
 	nsp_dbg(NSP_DEBUG_INIT, "link=0x%p", link);
 
 	/* Unlink the device chain */
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,2))
 	if (info->host != NULL) {
 		scsi_remove_host(info->host);
 	}
-#else
-	scsi_unregister_host(&nsp_driver_template);
-#endif
 	link->dev_node = NULL;
 
 	if (link->win) {
@@ -1962,11 +1838,9 @@ #endif
 	}
 	pcmcia_disable_device(link);
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,2))
 	if (info->host != NULL) {
 		scsi_host_put(info->host);
 	}
-#endif
 } /* nsp_cs_release */
 
 static int nsp_cs_suspend(struct pcmcia_device *link)
@@ -2013,7 +1887,6 @@ static int nsp_cs_resume(struct pcmcia_d
 /*===================================*
  *	module entry point
  *==================================*/
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,68))
 static struct pcmcia_device_id nsp_cs_ids[] = {
 	PCMCIA_DEVICE_PROD_ID123("IO DATA", "CBSC16       ", "1", 0x547e66dc, 0x0d63a3fd, 0x51de003a),
 	PCMCIA_DEVICE_PROD_ID123("KME    ", "SCSI-CARD-001", "1", 0x534c02bc, 0x52008408, 0x51de003a),
@@ -2037,28 +1910,12 @@ static struct pcmcia_driver nsp_driver  	.suspend	= nsp_cs_suspend,
 	.resume		= nsp_cs_resume,
 };
-#endif
 
 static int __init nsp_cs_init(void)
 {
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,68))
 	nsp_msg(KERN_INFO, "loading...");
 
 	return pcmcia_register_driver(&nsp_driver);
-#else
-	servinfo_t serv;
-
-	nsp_msg(KERN_INFO, "loading...");
-	pcmcia_get_card_services_info(&serv);
-	if (serv.Revision != CS_RELEASE_CODE) {
-		nsp_msg(KERN_DEBUG, "Card Services release does not match!");
-		return -EINVAL;
-	}
-	register_pcmcia_driver(&dev_info, &nsp_cs_attach, &nsp_cs_detach);
-
-	nsp_dbg(NSP_DEBUG_INIT, "out");
-	return 0;
-#endif
 }
 
 static void __exit nsp_cs_exit(void)
diff --git a/drivers/scsi/pcmcia/nsp_cs.h b/drivers/scsi/pcmcia/nsp_cs.h
index 8908b8e..9b7c629 100644
--- a/drivers/scsi/pcmcia/nsp_cs.h
+++ b/drivers/scsi/pcmcia/nsp_cs.h
@@ -227,13 +227,7 @@ #define BUSPHASE_STATUS      ( BUSMON_ST
 typedef struct scsi_info_t {
 	struct pcmcia_device	*p_dev;
 	struct Scsi_Host      *host;
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,74))
 	dev_node_t             node;
-#else
-	int	               ndev;
-	dev_node_t             node[8];
-	struct bus_operations *bus;
-#endif
 	int                    stop;
 } scsi_info_t;
 
@@ -302,22 +296,13 @@ static int        nsp_cs_config (struct 
 
 /* Linux SCSI subsystem specific functions */
 static struct Scsi_Host *nsp_detect     (struct scsi_host_template *sht);
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
-static        int        nsp_detect_old (struct scsi_host_template *sht);
-static        int        nsp_release_old(struct Scsi_Host *shpnt);
-#endif
 static const  char      *nsp_info       (struct Scsi_Host *shpnt);
 static        int        nsp_proc_info  (
-#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
 	                                 struct Scsi_Host *host,
-#endif
 					 char   *buffer,
 					 char  **start,
 					 off_t   offset,
 					 int     length,
-#if !(LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
-					 int     hostno,
-#endif
 					 int     inout);
 static        int        nsp_queuecommand(Scsi_Cmnd *SCpnt, void (* done)(Scsi_Cmnd *SCpnt));
 
@@ -414,12 +399,6 @@ #define MSG_EXT_SDTR         0x01
  * Compatibility functions
  */
 
-/* for Kernel 2.4 */
-#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0))
-#  define scsi_register_host(template)   scsi_register_module(MODULE_SCSI_HA, template)
-#  define scsi_unregister_host(template) scsi_unregister_module(MODULE_SCSI_HA, template)
-#  define scsi_host_put(host)            scsi_unregister(host)
-
 typedef void irqreturn_t;
 #  define IRQ_NONE      /* */
 #  define IRQ_HANDLED   /* */
@@ -460,11 +439,8 @@ static void cs_error(struct pcmcia_devic
 #  define BUFFER_ADDR (SCpnt->SCp.buffer->address)
 #endif
 
-/* for Kernel 2.6 */
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
 /* scatter-gather table */
 #  define BUFFER_ADDR ((char *)((unsigned int)(SCpnt->SCp.buffer->page) + SCpnt->SCp.buffer->offset))
-#endif
 
 #endif  /*__nsp_cs__*/
 /* end */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
