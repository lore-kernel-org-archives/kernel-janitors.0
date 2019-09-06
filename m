From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 15:40:53 +0000
Subject: [PATCH] ssb: make array pwr_info_offset static const, makes object smaller
Message-Id: <20190906154053.32218-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array pwr_info_offset on the stack but instead make it
static const. Makes the object code smaller by 207 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  26066	   3000	     64	  29130	   71ca	drivers/ssb/pci.o

After:
   text	   data	    bss	    dec	    hex	filename
  25763	   3096	     64	  28923	   70fb	drivers/ssb/pci.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ssb/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ssb/pci.c b/drivers/ssb/pci.c
index da2d2ab8104d..7c3ae52f2b15 100644
--- a/drivers/ssb/pci.c
+++ b/drivers/ssb/pci.c
@@ -595,7 +595,7 @@ static void sprom_extract_r8(struct ssb_sprom *out, const u16 *in)
 {
 	int i;
 	u16 o;
-	u16 pwr_info_offset[] = {
+	static const u16 pwr_info_offset[] = {
 		SSB_SROM8_PWR_INFO_CORE0, SSB_SROM8_PWR_INFO_CORE1,
 		SSB_SROM8_PWR_INFO_CORE2, SSB_SROM8_PWR_INFO_CORE3
 	};
-- 
2.20.1
