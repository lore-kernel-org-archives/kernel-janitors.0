From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Nov 2017 19:16:04 +0000
Subject: [PATCH] block: DAC960: make various char arrays static const, shrinks object size
Message-Id: <20171128191604.25435-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays ReadCacheStatus, WriteCacheStatus and
SenseErrors on the stack but instead make them static and constify them.
Makes the object code smaller by over 540 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
 151673	  32984	    960	 185617	  2d511	drivers/block/DAC960.o

After:
   text	   data	    bss	    dec	    hex	filename
 150869	  33240	    960	 185069	  2d2ed	drivers/block/DAC960.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/DAC960.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/block/DAC960.c b/drivers/block/DAC960.c
index 442e777bdfb2..f9fdcdd8c61f 100644
--- a/drivers/block/DAC960.c
+++ b/drivers/block/DAC960.c
@@ -2433,16 +2433,20 @@ static bool DAC960_V2_ReportDeviceConfiguration(DAC960_Controller_T
     {
       DAC960_V2_LogicalDeviceInfo_T *LogicalDeviceInfo  	Controller->V2.LogicalDeviceInformation[LogicalDriveNumber];
-      unsigned char *ReadCacheStatus[] = { "Read Cache Disabled",
-					   "Read Cache Enabled",
-					   "Read Ahead Enabled",
-					   "Intelligent Read Ahead Enabled",
-					   "-", "-", "-", "-" };
-      unsigned char *WriteCacheStatus[] = { "Write Cache Disabled",
-					    "Logical Device Read Only",
-					    "Write Cache Enabled",
-					    "Intelligent Write Cache Enabled",
-					    "-", "-", "-", "-" };
+      static const unsigned char * const ReadCacheStatus[] = {
+	"Read Cache Disabled",
+	"Read Cache Enabled",
+	"Read Ahead Enabled",
+	"Intelligent Read Ahead Enabled",
+	"-", "-", "-", "-"
+      };
+      unsigned char *WriteCacheStatus[] = {
+	"Write Cache Disabled",
+	"Logical Device Read Only",
+	"Write Cache Enabled",
+	"Intelligent Write Cache Enabled",
+	"-", "-", "-", "-"
+      };
       unsigned char *GeometryTranslation;
       if (LogicalDeviceInfo = NULL) continue;
       switch (LogicalDeviceInfo->DriveGeometry)
@@ -4345,14 +4349,16 @@ static void DAC960_V1_ProcessCompletedCommand(DAC960_Command_T *Command)
 static void DAC960_V2_ReadWriteError(DAC960_Command_T *Command)
 {
   DAC960_Controller_T *Controller = Command->Controller;
-  unsigned char *SenseErrors[] = { "NO SENSE", "RECOVERED ERROR",
-				   "NOT READY", "MEDIUM ERROR",
-				   "HARDWARE ERROR", "ILLEGAL REQUEST",
-				   "UNIT ATTENTION", "DATA PROTECT",
-				   "BLANK CHECK", "VENDOR-SPECIFIC",
-				   "COPY ABORTED", "ABORTED COMMAND",
-				   "EQUAL", "VOLUME OVERFLOW",
-				   "MISCOMPARE", "RESERVED" };
+  static const unsigned char * const SenseErrors[] = {
+    "NO SENSE", "RECOVERED ERROR",
+    "NOT READY", "MEDIUM ERROR",
+    "HARDWARE ERROR", "ILLEGAL REQUEST",
+    "UNIT ATTENTION", "DATA PROTECT",
+    "BLANK CHECK", "VENDOR-SPECIFIC",
+    "COPY ABORTED", "ABORTED COMMAND",
+    "EQUAL", "VOLUME OVERFLOW",
+    "MISCOMPARE", "RESERVED"
+  };
   unsigned char *CommandName = "UNKNOWN";
   switch (Command->CommandType)
     {
-- 
2.14.1

