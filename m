From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:11 +0000
Subject: [PATCH 16/33][SCSI] gdth_proc: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030411.30002.33960.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert the typedef'ed 'Scsi_Cmnd' to 'struct scsi_cmnd'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Last item before 'drivers/scsi/scsi_typedefs.h' can be removed.


diff --git a/drivers/scsi/gdth_proc.c b/drivers/scsi/gdth_proc.c
index de57734..07af36c 100644
--- a/drivers/scsi/gdth_proc.c
+++ b/drivers/scsi/gdth_proc.c
@@ -727,7 +727,7 @@ static void gdth_wait_completion(gdth_ha_str *ha, int busnum, int id)
 {
     ulong flags;
     int i;
-    Scsi_Cmnd *scp;
+    struct scsi_cmnd *scp;
     struct gdth_cmndinfo *cmndinfo;
     unchar b, t;
 
@@ -754,12 +754,12 @@ static void gdth_wait_completion(gdth_ha_str *ha, int busnum, int id)
 static void gdth_stop_timeout(gdth_ha_str *ha, int busnum, int id)
 {
     ulong flags;
-    Scsi_Cmnd *scp;
+    struct scsi_cmnd *scp;
     unchar b, t;
 
     spin_lock_irqsave(&ha->smp_lock, flags);
 
-    for (scp = ha->req_first; scp; scp = (Scsi_Cmnd *)scp->SCp.ptr) {
+    for (scp = ha->req_first; scp; scp = (struct scsi_cmnd *)scp->SCp.ptr) {
         struct gdth_cmndinfo *cmndinfo = gdth_cmnd_priv(scp);
         if (!cmndinfo->internal_command) {
             b = scp->device->channel;
@@ -776,12 +776,12 @@ static void gdth_stop_timeout(gdth_ha_str *ha, int busnum, int id)
 static void gdth_start_timeout(gdth_ha_str *ha, int busnum, int id)
 {
     ulong flags;
-    Scsi_Cmnd *scp;
+    struct scsi_cmnd *scp;
     unchar b, t;
 
     spin_lock_irqsave(&ha->smp_lock, flags);
 
-    for (scp = ha->req_first; scp; scp = (Scsi_Cmnd *)scp->SCp.ptr) {
+    for (scp = ha->req_first; scp; scp = (struct scsi_cmnd *)scp->SCp.ptr) {
         struct gdth_cmndinfo *cmndinfo = gdth_cmnd_priv(scp);
         if (!cmndinfo->internal_command) {
             b = scp->device->channel;
@@ -795,7 +795,7 @@ static void gdth_start_timeout(gdth_ha_str *ha, int busnum, int id)
     spin_unlock_irqrestore(&ha->smp_lock, flags);
 }
 
-static int gdth_update_timeout(Scsi_Cmnd *scp, int timeout)
+static int gdth_update_timeout(struct scsi_cmnd *scp, int timeout)
 {
     int oldto;
 
diff --git a/drivers/scsi/gdth_proc.h b/drivers/scsi/gdth_proc.h
index 45e6fda..09dfa60 100644
--- a/drivers/scsi/gdth_proc.h
+++ b/drivers/scsi/gdth_proc.h
@@ -22,7 +22,7 @@ static void gdth_ioctl_free(gdth_ha_str *ha, int size, char *buf, ulong64 paddr)
 static void gdth_wait_completion(gdth_ha_str *ha, int busnum, int id);
 static void gdth_stop_timeout(gdth_ha_str *ha, int busnum, int id);
 static void gdth_start_timeout(gdth_ha_str *ha, int busnum, int id);
-static int gdth_update_timeout(Scsi_Cmnd *scp, int timeout);
+static int gdth_update_timeout(struct scsi_cmnd *scp, int timeout);
 
 #endif
 
