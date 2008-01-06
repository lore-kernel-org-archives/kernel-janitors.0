From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:17 +0000
Subject: [PATCH 17/33][SCSI] g_NCR5380: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030417.30002.42297.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert the typedef'ed 'Scsi_Cmnd' to 'struct scsi_cmnd'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Last item before 'drivers/scsi/scsi_typedefs.h' can be removed.


diff --git a/drivers/scsi/g_NCR5380.c b/drivers/scsi/g_NCR5380.c
index 75585a5..5303e1d 100644
--- a/drivers/scsi/g_NCR5380.c
+++ b/drivers/scsi/g_NCR5380.c
@@ -774,7 +774,7 @@ static int sprint_command(char *buffer, int len, unsigned char *command)
  *	Print out the target and command data in hex
  */
 
-static int sprint_Scsi_Cmnd(char *buffer, int len, Scsi_Cmnd * cmd)
+static int sprint_Scsi_Cmnd(char *buffer, int len, struct scsi_cmnd *cmd)
 {
 	int start = len;
 	PRINTP("host number %d destination target %d, lun %d\n" ANDP cmd->device->host->host_no ANDP cmd->device->id ANDP cmd->device->lun);
@@ -807,7 +807,7 @@ static int generic_NCR5380_proc_info(struct Scsi_Host *scsi_ptr, char *buffer, c
 	unsigned long flags;
 	unsigned char status;
 	int i;
-	Scsi_Cmnd *ptr;
+	struct scsi_cmnd *ptr;
 	struct NCR5380_hostdata *hostdata;
 #ifdef NCR5380_STATS
 	struct scsi_device *dev;
@@ -886,17 +886,17 @@ static int generic_NCR5380_proc_info(struct Scsi_Host *scsi_ptr, char *buffer, c
 	if (!hostdata->connected) {
 		PRINTP("No currently connected command\n");
 	} else {
-		len += sprint_Scsi_Cmnd(buffer, len, (Scsi_Cmnd *) hostdata->connected);
+		len += sprint_Scsi_Cmnd(buffer, len, (struct scsi_cmnd *) hostdata->connected);
 	}
 
 	PRINTP("issue_queue\n");
 
-	for (ptr = (Scsi_Cmnd *) hostdata->issue_queue; ptr; ptr = (Scsi_Cmnd *) ptr->host_scribble)
+	for (ptr = (struct scsi_cmnd *) hostdata->issue_queue; ptr; ptr = (struct scsi_cmnd *) ptr->host_scribble)
 		len += sprint_Scsi_Cmnd(buffer, len, ptr);
 
 	PRINTP("disconnected_queue\n");
 
-	for (ptr = (Scsi_Cmnd *) hostdata->disconnected_queue; ptr; ptr = (Scsi_Cmnd *) ptr->host_scribble)
+	for (ptr = (struct scsi_cmnd *) hostdata->disconnected_queue; ptr; ptr = (struct scsi_cmnd *) ptr->host_scribble)
 		len += sprint_Scsi_Cmnd(buffer, len, ptr);
 
 	*start = buffer + offset;
diff --git a/drivers/scsi/g_NCR5380.h b/drivers/scsi/g_NCR5380.h
index df0b3f6..a49e789 100644
--- a/drivers/scsi/g_NCR5380.h
+++ b/drivers/scsi/g_NCR5380.h
@@ -43,11 +43,11 @@
 #endif
 
 #ifndef ASM
-static int generic_NCR5380_abort(Scsi_Cmnd *);
+static int generic_NCR5380_abort(struct scsi_cmnd *);
 static int generic_NCR5380_detect(struct scsi_host_template *);
 static int generic_NCR5380_release_resources(struct Scsi_Host *);
-static int generic_NCR5380_queue_command(Scsi_Cmnd *, void (*done)(Scsi_Cmnd *));
-static int generic_NCR5380_bus_reset(Scsi_Cmnd *);
+static int generic_NCR5380_queue_command(struct scsi_cmnd *, void (*done)(struct scsi_cmnd *));
+static int generic_NCR5380_bus_reset(struct scsi_cmnd *);
 static const char* generic_NCR5380_info(struct Scsi_Host *);
 
 #ifndef CMD_PER_LUN
