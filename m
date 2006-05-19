From: walter harms <wharms@bfs.de>
Date: Fri, 19 May 2006 16:00:15 +0000
Subject: [KJ] inux-2.6.16.16/drivers/scsi/megaraid.c make it compile with !
Message-Id: <446DEB8F.1040605@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040609060103070305030706"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040609060103070305030706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi list,
i notice that you can not compile the megaraid driver without
proc. some shifting of #ifdef prevent some 'unsed XY' warnings.
note that are 2 patchs 1. megaraid.c 2. megaraid.h.

re,
  wh




Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.16.16/drivers/scsi/megaraid.c.bak	2006-05-18 
21:57:57.720021832 +0200
+++ linux-2.6.16.16/drivers/scsi/megaraid.c	2006-05-18 
23:10:03.675376656 +0200
@@ -3180,6 +3180,15 @@
  	return len;
  }

+#else /* !PROC */
+
+static void
+mega_create_proc_entry(int index, struct proc_dir_entry *parent)
+{
+  while(0);
+}
+
+
  #endif


@@ -4343,7 +4352,7 @@
  	return 0;
  }

-
+#ifdef CONFIG_PROC_FS
  /**
   * mega_adapinq()
   * @adapter - pointer to our soft state
@@ -4448,6 +4457,7 @@

  	return rval;
  }
+#endif


  /**
@@ -4470,7 +4480,7 @@
  {
  	Scsi_Cmnd	*scmd;
  	struct	scsi_device *sdev;
-	unsigned long	flags = 0;
+//	unsigned long	flags = 0;
  	scb_t	*scb;
  	int	rval;

@@ -4965,8 +4975,9 @@
  {
  	struct Scsi_Host *host = pci_get_drvdata(pdev);
  	adapter_t *adapter = (adapter_t *)host->hostdata;
+#ifdef CONFIG_PROC_FS
  	char	buf[12] = { 0 };
-
+#endif
  	scsi_remove_host(host);

  	__megaraid_shutdown(adapter);
--- linux-2.6.16.16/drivers/scsi/megaraid.h.bak	2006-05-18 
23:10:32.693965160 +0200
+++ linux-2.6.16.16/drivers/scsi/megaraid.h	2006-05-18 
23:11:52.696802880 +0200
@@ -1001,7 +1001,6 @@
  static int megaraid_abort_and_reset(adapter_t *, Scsi_Cmnd *, int);
  static int megaraid_biosparam(struct scsi_device *, struct block_device *,
  		sector_t, int []);
-static int mega_print_inquiry(char *, char *);

  static int mega_build_sglist (adapter_t *adapter, scb_t *scb,
  			      u32 *buffer, u32 *length);
@@ -1023,6 +1022,8 @@
  static int mega_is_bios_enabled (adapter_t *);

  #ifdef CONFIG_PROC_FS
+static int mega_print_inquiry(char *, char *);
+
  static void mega_create_proc_entry(int, struct proc_dir_entry *);
  static int proc_read_config(char *, char **, off_t, int, int *, void *);
  static int proc_read_stat(char *, char **, off_t, int, int *, void *);
@@ -1039,11 +1040,13 @@
  static int proc_rdrv_30(char *, char **, off_t, int, int *, void *);
  static int proc_rdrv_40(char *, char **, off_t, int, int *, void *);
  static int proc_rdrv(adapter_t *, char *, int, int);
-#endif

  static int mega_adapinq(adapter_t *, dma_addr_t);
  static int mega_internal_dev_inquiry(adapter_t *, u8, u8, dma_addr_t);

+#endif
+
+
  static int mega_support_ext_cdb(adapter_t *);
  static mega_passthru* mega_prepare_passthru(adapter_t *, scb_t *,
  		Scsi_Cmnd *, int, int);

--------------040609060103070305030706
Content-Type: text/x-patch;
 name="megaraid.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="megaraid.c.diff"

--- linux-2.6.16.16/drivers/scsi/megaraid.c.bak	2006-05-18 21:57:57.720021832 +0200
+++ linux-2.6.16.16/drivers/scsi/megaraid.c	2006-05-18 23:10:03.675376656 +0200
@@ -3180,6 +3180,15 @@
 	return len;
 }
 
+#else /* !PROC */
+
+static void
+mega_create_proc_entry(int index, struct proc_dir_entry *parent)
+{
+  while(0);
+}
+
+
 #endif
 
 
@@ -4343,7 +4352,7 @@
 	return 0;
 }
 
-
+#ifdef CONFIG_PROC_FS
 /**
  * mega_adapinq()
  * @adapter - pointer to our soft state
@@ -4448,6 +4457,7 @@
 
 	return rval;
 }
+#endif
 
 
 /**
@@ -4470,7 +4480,7 @@
 {
 	Scsi_Cmnd	*scmd;
 	struct	scsi_device *sdev;
-	unsigned long	flags = 0;
+//	unsigned long	flags = 0;
 	scb_t	*scb;
 	int	rval;
 
@@ -4965,8 +4975,9 @@
 {
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	adapter_t *adapter = (adapter_t *)host->hostdata;
+#ifdef CONFIG_PROC_FS
 	char	buf[12] = { 0 };
-
+#endif
 	scsi_remove_host(host);
 
 	__megaraid_shutdown(adapter);

--------------040609060103070305030706
Content-Type: text/x-patch;
 name="megaraid.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="megaraid.h.diff"

--- linux-2.6.16.16/drivers/scsi/megaraid.h.bak	2006-05-18 23:10:32.693965160 +0200
+++ linux-2.6.16.16/drivers/scsi/megaraid.h	2006-05-18 23:11:52.696802880 +0200
@@ -1001,7 +1001,6 @@
 static int megaraid_abort_and_reset(adapter_t *, Scsi_Cmnd *, int);
 static int megaraid_biosparam(struct scsi_device *, struct block_device *,
 		sector_t, int []);
-static int mega_print_inquiry(char *, char *);
 
 static int mega_build_sglist (adapter_t *adapter, scb_t *scb,
 			      u32 *buffer, u32 *length);
@@ -1023,6 +1022,8 @@
 static int mega_is_bios_enabled (adapter_t *);
 
 #ifdef CONFIG_PROC_FS
+static int mega_print_inquiry(char *, char *);
+
 static void mega_create_proc_entry(int, struct proc_dir_entry *);
 static int proc_read_config(char *, char **, off_t, int, int *, void *);
 static int proc_read_stat(char *, char **, off_t, int, int *, void *);
@@ -1039,11 +1040,13 @@
 static int proc_rdrv_30(char *, char **, off_t, int, int *, void *);
 static int proc_rdrv_40(char *, char **, off_t, int, int *, void *);
 static int proc_rdrv(adapter_t *, char *, int, int);
-#endif
 
 static int mega_adapinq(adapter_t *, dma_addr_t);
 static int mega_internal_dev_inquiry(adapter_t *, u8, u8, dma_addr_t);
 
+#endif
+
+
 static int mega_support_ext_cdb(adapter_t *);
 static mega_passthru* mega_prepare_passthru(adapter_t *, scb_t *,
 		Scsi_Cmnd *, int, int);

--------------040609060103070305030706
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040609060103070305030706--
