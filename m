From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Sep 2017 14:25:15 +0000
Subject: [PATCH] nfc: s3fwrn5: make array match static const, reduces object code size
Message-Id: <20170919142515.23196-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-nfc@lists.01.org, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only array match on the stack, instead make
it static const.  Makes the object code smaller by over 310 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   8304	   1084	    128	   9516	   252c	drivers/nfc/s3fwrn5/firmware.o

After:
   text	   data	    bss	    dec	    hex	filename
   7894	   1180	    128	   9202	   23f2	drivers/nfc/s3fwrn5/firmware.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 38548bd970cd..b7828fb252f2 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -336,7 +336,7 @@ static int s3fwrn5_fw_get_base_addr(
 	struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinfo, u32 *base_addr)
 {
 	int i;
-	struct {
+	static const struct {
 		u8 version[4];
 		u32 base_addr;
 	} match[] = {
-- 
2.14.1

