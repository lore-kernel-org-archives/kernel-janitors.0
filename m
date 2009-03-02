From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 02 Mar 2009 21:34:37 +0000
Subject: [PATCH 11/16 v2] NULL noise: drivers/ide/ide-*.c
Message-Id: <20090302213436.27388.13985.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20090227012837.GQ28946@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/ide/ide-disk_proc.c:130:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-floppy_proc.c:32:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-proc.c:234:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-tape.c:2141:11: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 drivers/ide/ide-disk_proc.c   |    2 +-
 drivers/ide/ide-floppy_proc.c |    2 +-
 drivers/ide/ide-proc.c        |    2 +-
 drivers/ide/ide-tape.c        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ide/ide-disk_proc.c b/drivers/ide/ide-disk_proc.c
index 3f2a078..eaea3be 100644
--- a/drivers/ide/ide-disk_proc.c
+++ b/drivers/ide/ide-disk_proc.c
@@ -127,5 +127,5 @@ const struct ide_proc_devset ide_disk_settings[] = {
 	IDE_PROC_DEVSET(multcount,	0,    16),
 	IDE_PROC_DEVSET(nowerr,		0,     1),
 	IDE_PROC_DEVSET(wcache,		0,     1),
-	{ 0 },
+	{ NULL },
 };
diff --git a/drivers/ide/ide-floppy_proc.c b/drivers/ide/ide-floppy_proc.c
index 3ec762c..fcd4d81 100644
--- a/drivers/ide/ide-floppy_proc.c
+++ b/drivers/ide/ide-floppy_proc.c
@@ -29,5 +29,5 @@ const struct ide_proc_devset ide_floppy_settings[] = {
 	IDE_PROC_DEVSET(bios_head, 0,  255),
 	IDE_PROC_DEVSET(bios_sect, 0,   63),
 	IDE_PROC_DEVSET(ticks,	   0,  255),
-	{ 0 },
+	{ NULL },
 };
diff --git a/drivers/ide/ide-proc.c b/drivers/ide/ide-proc.c
index 0ee8887..10a88bf 100644
--- a/drivers/ide/ide-proc.c
+++ b/drivers/ide/ide-proc.c
@@ -231,7 +231,7 @@ static const struct ide_proc_devset ide_generic_settings[] = {
 	IDE_PROC_DEVSET(pio_mode, 0, 255),
 	IDE_PROC_DEVSET(unmaskirq, 0, 1),
 	IDE_PROC_DEVSET(using_dma, 0, 1),
-	{ 0 },
+	{ NULL },
 };
 
 static void proc_ide_settings_warn(void)
diff --git a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
index 733cb51..cafc67d 100644
--- a/drivers/ide/ide-tape.c
+++ b/drivers/ide/ide-tape.c
@@ -2142,7 +2142,7 @@ static const struct ide_proc_devset idetape_settings[] = {
 	__IDE_PROC_DEVSET(speed,	0, 0xffff, NULL, NULL),
 	__IDE_PROC_DEVSET(tdsc,		IDETAPE_DSC_RW_MIN, IDETAPE_DSC_RW_MAX,
 					mulf_tdsc, divf_tdsc),
-	{ 0 },
+	{ NULL },
 };
 #endif
 

