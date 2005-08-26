From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 26 Aug 2005 22:39:51 +0000
Subject: [KJ] [PATCH 1/2] More C99 initializers
Message-Id: <20050826223951.GA28191@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68804927158505191=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68804927158505191==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/alpha/kernel/machvec_impl.h |    2 -
 drivers/isdn/hisax/hfc4s8s_l1.c  |    8 ++--
 drivers/net/bnx2.c               |   12 +++---
 drivers/net/wireless/orinoco.c   |   78 +++++++++++++++++++--------------------
 drivers/s390/block/dasd_eckd.c   |   20 +++++-----
 drivers/s390/block/dasd_fba.c    |    4 +-
 drivers/s390/char/tape_34xx.c    |    4 +-
 drivers/s390/net/qeth_main.c     |    4 +-
 drivers/s390/scsi/zfcp_scsi.c    |   38 +++++++++----------
 include/asm-parisc/processor.h   |   21 +++++-----
 10 files changed, 96 insertions(+), 95 deletions(-)

Index: linux-sparse/arch/alpha/kernel/machvec_impl.h
===================================================================
--- linux-sparse.orig/arch/alpha/kernel/machvec_impl.h	2005-08-25 18:58:06.000000000 +0400
+++ linux-sparse/arch/alpha/kernel/machvec_impl.h	2005-08-26 18:53:34.000000000 +0400
@@ -41,7 +41,7 @@
 #define CAT1(x,y)  x##y
 #define CAT(x,y)   CAT1(x,y)
 
-#define DO_DEFAULT_RTC rtc_port: 0x70
+#define DO_DEFAULT_RTC .rtc_port = 0x70
 
 #define DO_EV4_MMU							\
 	.max_asn =			EV4_MAX_ASN,			\
Index: linux-sparse/drivers/isdn/hisax/hfc4s8s_l1.c
===================================================================
--- linux-sparse.orig/drivers/isdn/hisax/hfc4s8s_l1.c	2005-08-25 18:58:27.000000000 +0400
+++ linux-sparse/drivers/isdn/hisax/hfc4s8s_l1.c	2005-08-26 19:00:33.000000000 +0400
@@ -1659,10 +1659,10 @@ hfc4s8s_remove(struct pci_dev *pdev)
 }
 
 static struct pci_driver hfc4s8s_driver = {
-      name:"hfc4s8s_l1",
-      probe:hfc4s8s_probe,
-      remove:__devexit_p(hfc4s8s_remove),
-      id_table:hfc4s8s_ids,
+      .name	= "hfc4s8s_l1",
+      .probe	= hfc4s8s_probe,
+      .remove	= __devexit_p(hfc4s8s_remove),
+      .id_table	= hfc4s8s_ids,
 };
 
 /**********************/
Index: linux-sparse/drivers/net/wireless/orinoco.c
===================================================================
--- linux-sparse.orig/drivers/net/wireless/orinoco.c	2005-08-25 18:58:15.000000000 +0400
+++ linux-sparse/drivers/net/wireless/orinoco.c	2005-08-26 19:08:39.000000000 +0400
@@ -4322,36 +4322,36 @@ static const struct iw_priv_args orinoco
  */
 
 static const iw_handler	orinoco_handler[] = {
-	[SIOCSIWCOMMIT-SIOCIWFIRST] (iw_handler) orinoco_ioctl_commit,
-	[SIOCGIWNAME  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getname,
-	[SIOCSIWFREQ  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setfreq,
-	[SIOCGIWFREQ  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getfreq,
-	[SIOCSIWMODE  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setmode,
-	[SIOCGIWMODE  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getmode,
-	[SIOCSIWSENS  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setsens,
-	[SIOCGIWSENS  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getsens,
-	[SIOCGIWRANGE -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getiwrange,
-	[SIOCSIWSPY   -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setspy,
-	[SIOCGIWSPY   -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getspy,
-	[SIOCSIWAP    -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setwap,
-	[SIOCGIWAP    -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getwap,
-	[SIOCSIWSCAN  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setscan,
-	[SIOCGIWSCAN  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getscan,
-	[SIOCSIWESSID -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setessid,
-	[SIOCGIWESSID -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getessid,
-	[SIOCSIWNICKN -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setnick,
-	[SIOCGIWNICKN -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getnick,
-	[SIOCSIWRATE  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setrate,
-	[SIOCGIWRATE  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getrate,
-	[SIOCSIWRTS   -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setrts,
-	[SIOCGIWRTS   -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getrts,
-	[SIOCSIWFRAG  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setfrag,
-	[SIOCGIWFRAG  -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getfrag,
-	[SIOCGIWRETRY -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getretry,
-	[SIOCSIWENCODE-SIOCIWFIRST] (iw_handler) orinoco_ioctl_setiwencode,
-	[SIOCGIWENCODE-SIOCIWFIRST] (iw_handler) orinoco_ioctl_getiwencode,
-	[SIOCSIWPOWER -SIOCIWFIRST] (iw_handler) orinoco_ioctl_setpower,
-	[SIOCGIWPOWER -SIOCIWFIRST] (iw_handler) orinoco_ioctl_getpower,
+	[SIOCSIWCOMMIT-SIOCIWFIRST] = (iw_handler) orinoco_ioctl_commit,
+	[SIOCGIWNAME  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getname,
+	[SIOCSIWFREQ  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setfreq,
+	[SIOCGIWFREQ  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getfreq,
+	[SIOCSIWMODE  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setmode,
+	[SIOCGIWMODE  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getmode,
+	[SIOCSIWSENS  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setsens,
+	[SIOCGIWSENS  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getsens,
+	[SIOCGIWRANGE -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getiwrange,
+	[SIOCSIWSPY   -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setspy,
+	[SIOCGIWSPY   -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getspy,
+	[SIOCSIWAP    -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setwap,
+	[SIOCGIWAP    -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getwap,
+	[SIOCSIWSCAN  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setscan,
+	[SIOCGIWSCAN  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getscan,
+	[SIOCSIWESSID -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setessid,
+	[SIOCGIWESSID -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getessid,
+	[SIOCSIWNICKN -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setnick,
+	[SIOCGIWNICKN -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getnick,
+	[SIOCSIWRATE  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setrate,
+	[SIOCGIWRATE  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getrate,
+	[SIOCSIWRTS   -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setrts,
+	[SIOCGIWRTS   -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getrts,
+	[SIOCSIWFRAG  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setfrag,
+	[SIOCGIWFRAG  -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getfrag,
+	[SIOCGIWRETRY -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getretry,
+	[SIOCSIWENCODE-SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setiwencode,
+	[SIOCGIWENCODE-SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getiwencode,
+	[SIOCSIWPOWER -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_setpower,
+	[SIOCGIWPOWER -SIOCIWFIRST] = (iw_handler) orinoco_ioctl_getpower,
 };
 
 
@@ -4359,15 +4359,15 @@ static const iw_handler	orinoco_handler[
   Added typecasting since we no longer use iwreq_data -- Moustafa
  */
 static const iw_handler	orinoco_private_handler[] = {
-	[0] (iw_handler) orinoco_ioctl_reset,
-	[1] (iw_handler) orinoco_ioctl_reset,
-	[2] (iw_handler) orinoco_ioctl_setport3,
-	[3] (iw_handler) orinoco_ioctl_getport3,
-	[4] (iw_handler) orinoco_ioctl_setpreamble,
-	[5] (iw_handler) orinoco_ioctl_getpreamble,
-	[6] (iw_handler) orinoco_ioctl_setibssport,
-	[7] (iw_handler) orinoco_ioctl_getibssport,
-	[9] (iw_handler) orinoco_ioctl_getrid,
+	[0] = (iw_handler) orinoco_ioctl_reset,
+	[1] = (iw_handler) orinoco_ioctl_reset,
+	[2] = (iw_handler) orinoco_ioctl_setport3,
+	[3] = (iw_handler) orinoco_ioctl_getport3,
+	[4] = (iw_handler) orinoco_ioctl_setpreamble,
+	[5] = (iw_handler) orinoco_ioctl_getpreamble,
+	[6] = (iw_handler) orinoco_ioctl_setibssport,
+	[7] = (iw_handler) orinoco_ioctl_getibssport,
+	[9] = (iw_handler) orinoco_ioctl_getrid,
 };
 
 static const struct iw_handler_def orinoco_handler_def = {
Index: linux-sparse/drivers/net/bnx2.c
===================================================================
--- linux-sparse.orig/drivers/net/bnx2.c	2005-08-25 18:58:14.000000000 +0400
+++ linux-sparse/drivers/net/bnx2.c	2005-08-26 19:10:10.000000000 +0400
@@ -5505,12 +5505,12 @@ bnx2_resume(struct pci_dev *pdev)
 }
 
 static struct pci_driver bnx2_pci_driver = {
-	name:		DRV_MODULE_NAME,
-	id_table:	bnx2_pci_tbl,
-	probe:		bnx2_init_one,
-	remove:		__devexit_p(bnx2_remove_one),
-	suspend:	bnx2_suspend,
-	resume:		bnx2_resume,
+	.name		= DRV_MODULE_NAME,
+	.id_table	= bnx2_pci_tbl,
+	.probe		= bnx2_init_one,
+	.remove		= __devexit_p(bnx2_remove_one),
+	.suspend	= bnx2_suspend,
+	.resume		= bnx2_resume,
 };
 
 static int __init bnx2_init(void)
Index: linux-sparse/include/asm-parisc/processor.h
===================================================================
--- linux-sparse.orig/include/asm-parisc/processor.h	2005-08-25 18:58:52.000000000 +0400
+++ linux-sparse/include/asm-parisc/processor.h	2005-08-26 21:29:28.000000000 +0400
@@ -124,16 +124,17 @@ struct thread_struct {
 #define PARISC_KERNEL_DEATH	(1UL << 31)	/* see die_if_kernel()... */
 
 #define INIT_THREAD { \
-	regs:	{	gr: { 0, }, \
-			fr: { 0, }, \
-			sr: { 0, }, \
-			iasq: { 0, }, \
-			iaoq: { 0, }, \
-			cr27: 0, \
-		}, \
-	task_size:      DEFAULT_TASK_SIZE, \
-	map_base:       DEFAULT_MAP_BASE, \
-	flags:          0 \
+	.regs = { \
+		.gr	= { 0, }, \
+		.fr	= { 0, }, \
+		.sr	= { 0, }, \
+		.iasq	= { 0, }, \
+		.iaoq	= { 0, }, \
+		.cr27	= 0, \
+	}, \
+	.task_size	= DEFAULT_TASK_SIZE, \
+	.map_base	= DEFAULT_MAP_BASE, \
+	.flags		= 0 \
 	}
 
 /*
Index: linux-sparse/drivers/s390/block/dasd_eckd.c
===================================================================
--- linux-sparse.orig/drivers/s390/block/dasd_eckd.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/block/dasd_eckd.c	2005-08-26 21:33:56.000000000 +0400
@@ -66,16 +66,16 @@ struct dasd_eckd_private {
 /* The ccw bus type uses this table to find devices that it sends to
  * dasd_eckd_probe */
 static struct ccw_device_id dasd_eckd_ids[] = {
-	{ CCW_DEVICE_DEVTYPE (0x3990, 0, 0x3390, 0), driver_info: 0x1},
-	{ CCW_DEVICE_DEVTYPE (0x2105, 0, 0x3390, 0), driver_info: 0x2},
-	{ CCW_DEVICE_DEVTYPE (0x3880, 0, 0x3390, 0), driver_info: 0x3},
-	{ CCW_DEVICE_DEVTYPE (0x3990, 0, 0x3380, 0), driver_info: 0x4},
-	{ CCW_DEVICE_DEVTYPE (0x2105, 0, 0x3380, 0), driver_info: 0x5},
-	{ CCW_DEVICE_DEVTYPE (0x9343, 0, 0x9345, 0), driver_info: 0x6},
-	{ CCW_DEVICE_DEVTYPE (0x2107, 0, 0x3390, 0), driver_info: 0x7},
-	{ CCW_DEVICE_DEVTYPE (0x2107, 0, 0x3380, 0), driver_info: 0x8},
-	{ CCW_DEVICE_DEVTYPE (0x1750, 0, 0x3390, 0), driver_info: 0x9},
-	{ CCW_DEVICE_DEVTYPE (0x1750, 0, 0x3380, 0), driver_info: 0xa},
+	{ CCW_DEVICE_DEVTYPE (0x3990, 0, 0x3390, 0), .driver_info = 0x1},
+	{ CCW_DEVICE_DEVTYPE (0x2105, 0, 0x3390, 0), .driver_info = 0x2},
+	{ CCW_DEVICE_DEVTYPE (0x3880, 0, 0x3390, 0), .driver_info = 0x3},
+	{ CCW_DEVICE_DEVTYPE (0x3990, 0, 0x3380, 0), .driver_info = 0x4},
+	{ CCW_DEVICE_DEVTYPE (0x2105, 0, 0x3380, 0), .driver_info = 0x5},
+	{ CCW_DEVICE_DEVTYPE (0x9343, 0, 0x9345, 0), .driver_info = 0x6},
+	{ CCW_DEVICE_DEVTYPE (0x2107, 0, 0x3390, 0), .driver_info = 0x7},
+	{ CCW_DEVICE_DEVTYPE (0x2107, 0, 0x3380, 0), .driver_info = 0x8},
+	{ CCW_DEVICE_DEVTYPE (0x1750, 0, 0x3390, 0), .driver_info = 0x9},
+	{ CCW_DEVICE_DEVTYPE (0x1750, 0, 0x3380, 0), .driver_info = 0xa},
 	{ /* end of list */ },
 };
 
Index: linux-sparse/drivers/s390/block/dasd_fba.c
===================================================================
--- linux-sparse.orig/drivers/s390/block/dasd_fba.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/block/dasd_fba.c	2005-08-26 21:36:02.000000000 +0400
@@ -46,8 +46,8 @@ struct dasd_fba_private {
 };
 
 static struct ccw_device_id dasd_fba_ids[] = {
-	{ CCW_DEVICE_DEVTYPE (0x6310, 0, 0x9336, 0), driver_info: 0x1},
-	{ CCW_DEVICE_DEVTYPE (0x3880, 0, 0x3370, 0), driver_info: 0x2},
+	{ CCW_DEVICE_DEVTYPE (0x6310, 0, 0x9336, 0), .driver_info = 0x1},
+	{ CCW_DEVICE_DEVTYPE (0x3880, 0, 0x3370, 0), .driver_info = 0x2},
 	{ /* end of list */ },
 };
 
Index: linux-sparse/drivers/s390/char/tape_34xx.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/tape_34xx.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/tape_34xx.c	2005-08-26 21:36:47.000000000 +0400
@@ -1316,8 +1316,8 @@ static struct tape_discipline tape_disci
 };
 
 static struct ccw_device_id tape_34xx_ids[] = {
-	{ CCW_DEVICE_DEVTYPE(0x3480, 0, 0x3480, 0), driver_info: tape_3480},
-	{ CCW_DEVICE_DEVTYPE(0x3490, 0, 0x3490, 0), driver_info: tape_3490},
+	{ CCW_DEVICE_DEVTYPE(0x3480, 0, 0x3480, 0), .driver_info = tape_3480},
+	{ CCW_DEVICE_DEVTYPE(0x3490, 0, 0x3490, 0), .driver_info = tape_3490},
 	{ /* end of list */ }
 };
 
Index: linux-sparse/drivers/s390/net/qeth_main.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/qeth_main.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/net/qeth_main.c	2005-08-26 21:37:33.000000000 +0400
@@ -7591,8 +7591,8 @@ qeth_set_online(struct ccwgroup_device *
 }
 
 static struct ccw_device_id qeth_ids[] = {
-	{CCW_DEVICE(0x1731, 0x01), driver_info:QETH_CARD_TYPE_OSAE},
-	{CCW_DEVICE(0x1731, 0x05), driver_info:QETH_CARD_TYPE_IQD},
+	{CCW_DEVICE(0x1731, 0x01), .driver_info = QETH_CARD_TYPE_OSAE},
+	{CCW_DEVICE(0x1731, 0x05), .driver_info = QETH_CARD_TYPE_IQD},
 	{},
 };
 MODULE_DEVICE_TABLE(ccw, qeth_ids);
Index: linux-sparse/drivers/s390/scsi/zfcp_scsi.c
===================================================================
--- linux-sparse.orig/drivers/s390/scsi/zfcp_scsi.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/scsi/zfcp_scsi.c	2005-08-26 21:40:25.000000000 +0400
@@ -57,30 +57,30 @@ struct scsi_transport_template *zfcp_tra
 
 struct zfcp_data zfcp_data = {
 	.scsi_host_template = {
-	      name:	               ZFCP_NAME,
-	      proc_name:               "zfcp",
-	      proc_info:               NULL,
-	      detect:	               NULL,
-	      slave_alloc:             zfcp_scsi_slave_alloc,
-	      slave_configure:         zfcp_scsi_slave_configure,
-	      slave_destroy:           zfcp_scsi_slave_destroy,
-	      queuecommand:            zfcp_scsi_queuecommand,
-	      eh_abort_handler:        zfcp_scsi_eh_abort_handler,
-	      eh_device_reset_handler: zfcp_scsi_eh_device_reset_handler,
-	      eh_bus_reset_handler:    zfcp_scsi_eh_bus_reset_handler,
-	      eh_host_reset_handler:   zfcp_scsi_eh_host_reset_handler,
+	      .name			= ZFCP_NAME,
+	      .proc_name		= "zfcp",
+	      .proc_info		= NULL,
+	      .detect			= NULL,
+	      .slave_alloc		= zfcp_scsi_slave_alloc,
+	      .slave_configure		= zfcp_scsi_slave_configure,
+	      .slave_destroy		= zfcp_scsi_slave_destroy,
+	      .queuecommand		= zfcp_scsi_queuecommand,
+	      .eh_abort_handler		= zfcp_scsi_eh_abort_handler,
+	      .eh_device_reset_handler	= zfcp_scsi_eh_device_reset_handler,
+	      .eh_bus_reset_handler	= zfcp_scsi_eh_bus_reset_handler,
+	      .eh_host_reset_handler	= zfcp_scsi_eh_host_reset_handler,
 			               /* FIXME(openfcp): Tune */
-	      can_queue:               4096,
-	      this_id:	               0,
+	      .can_queue		= 4096,
+	      .this_id			= 0,
 	      /*
 	       * FIXME:
 	       * one less? can zfcp_create_sbale cope with it?
 	       */
-	      sg_tablesize:            ZFCP_MAX_SBALES_PER_REQ,
-	      cmd_per_lun:             1,
-	      unchecked_isa_dma:       0,
-	      use_clustering:          1,
-	      sdev_attrs:              zfcp_sysfs_sdev_attrs,
+	      .sg_tablesize		= ZFCP_MAX_SBALES_PER_REQ,
+	      .cmd_per_lun		= 1,
+	      .unchecked_isa_dma	= 0,
+	      .use_clustering		= 1,
+	      .sdev_attrs		= zfcp_sysfs_sdev_attrs,
 	},
 	.driver_version = ZFCP_VERSION,
 	/* rest initialised with zeros */


--===============68804927158505191==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68804927158505191==--
