From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Thu, 19 Feb 2015 12:49:20 +0000
Subject: [PATCH 1/1] staging: unisys: Remove unnecessary OOM message
Message-Id: <20150219124920.GA20085@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Romer <benjamin.romer@unisys.com>, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch reduces the kernel size by removing error messages that duplicate
the normal OOM message.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr)

@@
identifier f,print,l;
expression e;
constant char[] c;
@@

e = \(kzalloc\|kmalloc\|devm_kzalloc\|devm_kmalloc\)(...);
if (e = NULL) {
  <+...
-  print(...,c,...);
  ... when any
(
  goto l;
|
  return ...;
)
  ...+> }

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/unisys/uislib/uislib.c              |  2 --
 drivers/staging/unisys/virthba/virthba.c            | 21 ++++++---------------
 drivers/staging/unisys/virtpci/virtpci.c            |  1 -
 .../unisys/visorchannel/visorchannel_funcs.c        |  1 -
 drivers/staging/unisys/visorchipset/parser.c        |  2 --
 .../staging/unisys/visorchipset/visorchipset_main.c |  4 ----
 drivers/staging/unisys/visorutil/memregion_direct.c |  4 +---
 drivers/staging/unisys/visorutil/procobjecttree.c   | 21 +++++----------------
 8 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/unisys/uislib/uislib.c b/drivers/staging/unisys/uislib/uislib.c
index a9eedde..77bf247 100644
--- a/drivers/staging/unisys/uislib/uislib.c
+++ b/drivers/staging/unisys/uislib/uislib.c
@@ -172,7 +172,6 @@ create_bus(struct controlvm_message *msg, char *buf)
 	    (dev_count * sizeof(struct device_info *));
 	bus = kzalloc(size, GFP_ATOMIC);
 	if (!bus) {
-		LOGERR("CONTROLVM_BUS_CREATE Failed: kmalloc for bus failed.\n");
 		POSTCODE_LINUX_3(BUS_CREATE_FAILURE_PC, bus_no,
 				 POSTCODE_SEVERITY_ERR);
 		return CONTROLVM_RESP_ERROR_KMALLOC_FAILED;
@@ -357,7 +356,6 @@ static int create_device(struct controlvm_message *msg, char *buf)
 
 	dev = kzalloc(sizeof(*dev), GFP_ATOMIC);
 	if (!dev) {
-		LOGERR("CONTROLVM_DEVICE_CREATE Failed: kmalloc for dev failed.\n");
 		POSTCODE_LINUX_4(DEVICE_CREATE_FAILURE_PC, dev_no, bus_no,
 				 POSTCODE_SEVERITY_ERR);
 		return CONTROLVM_RESP_ERROR_KMALLOC_FAILED;
diff --git a/drivers/staging/unisys/virthba/virthba.c b/drivers/staging/unisys/virthba/virthba.c
index e6ecea5..e7af285 100644
--- a/drivers/staging/unisys/virthba/virthba.c
+++ b/drivers/staging/unisys/virthba/virthba.c
@@ -695,10 +695,8 @@ forward_vdiskmgmt_command(enum vdisk_mgmt_types vdiskcmdtype,
 	}
 
 	cmdrsp = kzalloc(SIZEOF_CMDRSP, GFP_ATOMIC);
-	if (cmdrsp = NULL) {
-		LOGERR("kmalloc of cmdrsp failed.\n");
-		return FAILED;	/* reject */
-	}
+	if (cmdrsp = NULL)
+		return FAILED;  /* reject */
 
 	init_waitqueue_head(&notifyevent);
 
@@ -758,10 +756,8 @@ forward_taskmgmt_command(enum task_mgmt_types tasktype,
 	}
 
 	cmdrsp = kzalloc(SIZEOF_CMDRSP, GFP_ATOMIC);
-	if (cmdrsp = NULL) {
-		LOGERR("kmalloc of cmdrsp failed.\n");
-		return FAILED;	/* reject */
-	}
+	if (cmdrsp = NULL)
+		return FAILED;  /* reject */
 
 	init_waitqueue_head(&notifyevent);
 
@@ -929,10 +925,8 @@ virthba_queue_command_lck(struct scsi_cmnd *scsicmd,
 	}
 
 	cmdrsp = kzalloc(SIZEOF_CMDRSP, GFP_ATOMIC);
-	if (cmdrsp = NULL) {
-		LOGERR("kmalloc of cmdrsp failed.\n");
+	if (cmdrsp = NULL)
 		return 1;	/* reject the command */
-	}
 
 	/* now saving everything we need from scsi_cmd into cmdrsp
 	 * before we queue cmdrsp set type to command - as opposed to
@@ -1064,10 +1058,8 @@ virthba_slave_alloc(struct scsi_device *scsidev)
 			return 0;
 	}
 	tmpvdisk = kzalloc(sizeof(*tmpvdisk), GFP_ATOMIC);
-	if (!tmpvdisk) {	/* error allocating */
-		LOGERR("Could not allocate memory for disk\n");
+	if (!tmpvdisk)
 		return 0;
-	}
 
 	tmpvdisk->channel = scsidev->channel;
 	tmpvdisk->id = scsidev->id;
@@ -1342,7 +1334,6 @@ process_incoming_rsps(void *v)
 	/* alloc once and reuse */
 	cmdrsp = kmalloc(SZ, GFP_ATOMIC);
 	if (cmdrsp = NULL) {
-		LOGERR("process_incoming_rsps ****FAILED to malloc - thread exiting\n");
 		complete_and_exit(&dc->threadinfo.has_stopped, 0);
 		return 0;
 	}
diff --git a/drivers/staging/unisys/virtpci/virtpci.c b/drivers/staging/unisys/virtpci/virtpci.c
index 8fdfd6f..edaf43f 100644
--- a/drivers/staging/unisys/virtpci/virtpci.c
+++ b/drivers/staging/unisys/virtpci/virtpci.c
@@ -931,7 +931,6 @@ static int virtpci_device_add(struct device *parentbus, int devtype,
 	/* add a Virtual Device */
 	virtpcidev = kzalloc(sizeof(*virtpcidev), GFP_ATOMIC);
 	if (virtpcidev = NULL) {
-		LOGERR("can't add device - malloc FALLED\n");
 		POSTCODE_LINUX_2(MALLOC_FAILURE_PC, POSTCODE_SEVERITY_ERR);
 		return 0;
 	}
diff --git a/drivers/staging/unisys/visorchannel/visorchannel_funcs.c b/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
index 0188ef8..90cea7d 100644
--- a/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
+++ b/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
@@ -59,7 +59,6 @@ visorchannel_create_guts(HOSTADDRESS physaddr, ulong channel_bytes,
 
 	p = kmalloc(sizeof(*p), GFP_KERNEL|__GFP_NORETRY);
 	if (p = NULL) {
-		ERRDRV("allocation failed: (status=0)\n");
 		rc = NULL;
 		goto cleanup;
 	}
diff --git a/drivers/staging/unisys/visorchipset/parser.c b/drivers/staging/unisys/visorchipset/parser.c
index 9edbd3b..686fe64 100644
--- a/drivers/staging/unisys/visorchipset/parser.c
+++ b/drivers/staging/unisys/visorchipset/parser.c
@@ -69,8 +69,6 @@ parser_init_guts(u64 addr, u32 bytes, BOOL isLocal,
 	}
 	ctx = kzalloc(allocbytes, GFP_KERNEL|__GFP_NORETRY);
 	if (ctx = NULL) {
-		ERRDRV("%s (%s:%d) - failed to allocate %d bytes",
-		       __func__, __FILE__, __LINE__, allocbytes);
 		if (tryAgain)
 			*tryAgain = TRUE;
 		rc = NULL;
diff --git a/drivers/staging/unisys/visorchipset/visorchipset_main.c b/drivers/staging/unisys/visorchipset/visorchipset_main.c
index f606ee9..6f55195 100644
--- a/drivers/staging/unisys/visorchipset/visorchipset_main.c
+++ b/drivers/staging/unisys/visorchipset/visorchipset_main.c
@@ -1118,8 +1118,6 @@ bus_create(struct controlvm_message *inmsg)
 	}
 	pBusInfo = kzalloc(sizeof(struct visorchipset_bus_info), GFP_KERNEL);
 	if (pBusInfo = NULL) {
-		LOGERR("CONTROLVM_BUS_CREATE Failed: bus %lu kzalloc failed",
-		       busNo);
 		POSTCODE_LINUX_3(BUS_CREATE_FAILURE_PC, busNo,
 				 POSTCODE_SEVERITY_ERR);
 		rc = -CONTROLVM_RESP_ERROR_KMALLOC_FAILED;
@@ -1268,8 +1266,6 @@ my_device_create(struct controlvm_message *inmsg)
 	}
 	pDevInfo = kzalloc(sizeof(struct visorchipset_device_info), GFP_KERNEL);
 	if (pDevInfo = NULL) {
-		LOGERR("CONTROLVM_DEVICE_CREATE Failed: busNo=%lu, devNo=%lu kmaloc failed",
-		     busNo, devNo);
 		POSTCODE_LINUX_4(DEVICE_CREATE_FAILURE_PC, devNo, busNo,
 				 POSTCODE_SEVERITY_ERR);
 		rc = -CONTROLVM_RESP_ERROR_KMALLOC_FAILED;
diff --git a/drivers/staging/unisys/visorutil/memregion_direct.c b/drivers/staging/unisys/visorutil/memregion_direct.c
index 33522cc..cd0b88c 100644
--- a/drivers/staging/unisys/visorutil/memregion_direct.c
+++ b/drivers/staging/unisys/visorutil/memregion_direct.c
@@ -85,10 +85,8 @@ visor_memregion_create_overlapped(struct memregion *parent, ulong offset,
 		return NULL;
 	}
 	memregion = kzalloc(sizeof(*memregion), GFP_KERNEL|__GFP_NORETRY);
-	if (memregion = NULL) {
-		ERRDRV("%s allocation failed", __func__);
+	if (memregion = NULL)
 		return NULL;
-	}
 
 	memregion->physaddr = parent->physaddr + offset;
 	memregion->nbytes = nbytes;
diff --git a/drivers/staging/unisys/visorutil/procobjecttree.c b/drivers/staging/unisys/visorutil/procobjecttree.c
index 82279ca..0672e8c 100644
--- a/drivers/staging/unisys/visorutil/procobjecttree.c
+++ b/drivers/staging/unisys/visorutil/procobjecttree.c
@@ -146,10 +146,8 @@ MYPROCTYPE *visor_proc_CreateType(struct proc_dir_entry *procDirRoot,
 		goto Away;
 	}
 	type = kzalloc(sizeof(MYPROCTYPE), GFP_KERNEL | __GFP_NORETRY);
-	if (type = NULL) {
-		ERRDRV("out of memory\n");
+	if (type = NULL)
 		goto Away;
-	}
 	type->name = name;
 	type->propertyNames = propertyNames;
 	type->nProperties = 0;
@@ -164,10 +162,8 @@ MYPROCTYPE *visor_proc_CreateType(struct proc_dir_entry *procDirRoot,
 	type->procDirs = kzalloc((type->nNames + 1) *
 				 sizeof(struct proc_dir_entry *),
 				 GFP_KERNEL | __GFP_NORETRY);
-	if (type->procDirs = NULL) {
-		ERRDRV("out of memory\n");
+	if (type->procDirs = NULL)
 		goto Away;
-	}
 	parent = procDirRoot;
 	for (i = 0; i < type->nNames; i++) {
 		type->procDirs[i] = createProcDir(type->name[i], parent);
@@ -231,10 +227,8 @@ MYPROCOBJECT *visor_proc_CreateObject(MYPROCTYPE *type,
 		goto Away;
 	}
 	obj = kzalloc(sizeof(MYPROCOBJECT), GFP_KERNEL | __GFP_NORETRY);
-	if (obj = NULL) {
-		ERRDRV("out of memory\n");
+	if (obj = NULL)
 		goto Away;
-	}
 	obj->type = type;
 	obj->context = context;
 	if (name = NULL) {
@@ -245,7 +239,6 @@ MYPROCOBJECT *visor_proc_CreateObject(MYPROCTYPE *type,
 		obj->name = kmalloc(obj->namesize, GFP_KERNEL | __GFP_NORETRY);
 		if (obj->name = NULL) {
 			obj->namesize = 0;
-			ERRDRV("out of memory\n");
 			goto Away;
 		}
 		strcpy(obj->name, name);
@@ -257,17 +250,13 @@ MYPROCOBJECT *visor_proc_CreateObject(MYPROCTYPE *type,
 		kzalloc((type->nProperties + 1) *
 			sizeof(struct proc_dir_entry_context),
 			GFP_KERNEL | __GFP_NORETRY);
-	if (obj->procDirPropertyContexts = NULL) {
-		ERRDRV("out of memory\n");
+	if (obj->procDirPropertyContexts = NULL)
 		goto Away;
-	}
 	obj->procDirProperties = kzalloc((type->nProperties + 1) *
 					 sizeof(struct proc_dir_entry *),
 					 GFP_KERNEL | __GFP_NORETRY);
-	if (obj->procDirProperties = NULL) {
-		ERRDRV("out of memory\n");
+	if (obj->procDirProperties = NULL)
 		goto Away;
-	}
 	for (i = 0; i < type->nProperties; i++) {
 		obj->procDirPropertyContexts[i].procObject = obj;
 		obj->procDirPropertyContexts[i].propertyIndex = i;
-- 
1.9.1

