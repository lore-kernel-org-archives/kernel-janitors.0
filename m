From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:16:08 +0000
Subject: [PATCH v2 09/15] NULL noise: drivers/scsi/FlashPoint.c
Message-Id: <20090305191602.30062.71301.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>

Fix this sparse warnings:
  drivers/scsi/FlashPoint.c:906:9: warning: Using plain integer as NULL pointer
  drivers/scsi/FlashPoint.c:907:53: warning: Using plain integer as NULL pointer
  drivers/scsi/FlashPoint.c:922:1: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: fix checkpatch.pl issue.
v2.1: other subject, as suggested by Al Viro

 drivers/scsi/FlashPoint.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/FlashPoint.c b/drivers/scsi/FlashPoint.c
index b898d38..9eb2e86 100644
--- a/drivers/scsi/FlashPoint.c
+++ b/drivers/scsi/FlashPoint.c
@@ -903,8 +903,8 @@ static void FPT_autoCmdCmplt(unsigned long p_port, unsigned char p_card);
 static void FPT_autoLoadDefaultMap(unsigned long p_port);
 
 static struct sccb_mgr_tar_info FPT_sccbMgrTbl[MAX_CARDS][MAX_SCSI_TAR] -    { {{0}} };
-static struct sccb_card FPT_BL_Card[MAX_CARDS] = { {0} };
+    { { {NULL} } };
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

