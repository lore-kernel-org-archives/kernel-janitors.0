From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:02:50 +0000
Subject: [PATCH 08/16] [SCSI] FlashPoint: fix sparse warnings: Using plain
Message-Id: <20090222000242.17557.32246.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/scsi/FlashPoint.c:906:9: warning: Using plain integer as NULL pointer
  drivers/scsi/FlashPoint.c:907:53: warning: Using plain integer as NULL pointer
  drivers/scsi/FlashPoint.c:922:1: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/scsi/FlashPoint.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/FlashPoint.c b/drivers/scsi/FlashPoint.c
index cb601cf..9b2ea80 100644
--- a/drivers/scsi/FlashPoint.c
+++ b/drivers/scsi/FlashPoint.c
@@ -903,8 +903,8 @@ static void FPT_autoCmdCmplt(unsigned long p_port, unsigned char p_card);
 static void FPT_autoLoadDefaultMap(unsigned long p_port);
 
 static struct sccb_mgr_tar_info FPT_sccbMgrTbl[MAX_CARDS][MAX_SCSI_TAR] -    { {{0}} };
-static struct sccb_card FPT_BL_Card[MAX_CARDS] = { {0} };
+    { {{NULL}} };
+static struct sccb_card FPT_BL_Card[MAX_CARDS] = { {NULL} };
 static SCCBSCAM_INFO FPT_scamInfo[MAX_SCSI_TAR] = { {{0}} };
 static struct nvram_info FPT_nvRamInfo[MAX_MB_CARDS] = { {0} };
 
@@ -918,8 +918,7 @@ static unsigned char FPT_scamHAString[]  
 static unsigned short FPT_default_intena = 0;
 
-static void (*FPT_s_PhaseTbl[8]) (unsigned long, unsigned char) = {
-0};
+static void (*FPT_s_PhaseTbl[8]) (unsigned long, unsigned char) = {NULL};
 
 /*---------------------------------------------------------------------
  *

