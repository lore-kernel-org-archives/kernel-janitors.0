From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:01:56 +0000
Subject: [PATCH 04/16] ide: fix sparse warnings: Using plain integer as NULL
Message-Id: <20090222000150.17557.8753.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/ide/ide-disk_proc.c:130:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-floppy_proc.c:32:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-proc.c:234:11: warning: Using plain integer as NULL pointer
  drivers/ide/ide-tape.c:2141:11: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
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
index 1b97d7a..e9e570f 100644
--- a/drivers/ide/ide-tape.c
+++ b/drivers/ide/ide-tape.c
@@ -2138,7 +2138,7 @@ static const struct ide_proc_devset idetape_settings[] = {
 	__IDE_PROC_DEVSET(speed,	0, 0xffff, NULL, NULL),
 	__IDE_PROC_DEVSET(tdsc,		IDETAPE_DSC_RW_MIN, IDETAPE_DSC_RW_MAX,
 					mulf_tdsc, divf_tdsc),
-	{ 0 },
+	{ NULL },
 };
 #endif
 

