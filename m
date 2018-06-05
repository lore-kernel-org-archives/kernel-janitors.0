From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Jun 2018 16:51:07 +0000
Subject: [PATCH] ipmi_si: fix potential integer overflow on large shift
Message-Id: <20180605165108.26379-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting unsigned char b by an int type can lead to sign-extension
overflow. For example, if b is 0xff and the shift is 24, then top
bit is sign-extended so the final value passed to writeq has all
the upper 32 bits set.  Fix this by casting b to a 64 bit unsigned
before the shift.

Detected by CoverityScan, CID#1465246 ("Unintended sign extension")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_si_mem_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_mem_io.c b/drivers/char/ipmi/ipmi_si_mem_io.c
index 1b869d530884..fd0ec8d6bf0e 100644
--- a/drivers/char/ipmi/ipmi_si_mem_io.c
+++ b/drivers/char/ipmi/ipmi_si_mem_io.c
@@ -51,7 +51,7 @@ static unsigned char mem_inq(const struct si_sm_io *io, unsigned int offset)
 static void mem_outq(const struct si_sm_io *io, unsigned int offset,
 		     unsigned char b)
 {
-	writeq(b << io->regshift, (io->addr)+(offset * io->regspacing));
+	writeq((u64)b << io->regshift, (io->addr)+(offset * io->regspacing));
 }
 #endif
 
-- 
2.17.0

