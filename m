From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Aug 2008 15:15:49 +0000
Subject: [PATCH 9/10] drivers/scsi/megaraid: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0808021715270.20095@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: megaraidlinux@lsi.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
(d)) but is perhaps more readable.

An extract of the semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression n,d;
@@

(
- (n + d - 1) / d
+ DIV_ROUND_UP(n,d)
|
- (n + (d - 1)) / d
+ DIV_ROUND_UP(n,d)
)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP((n),d)
+ DIV_ROUND_UP(n,d)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP(n,(d))
+ DIV_ROUND_UP(n,d)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/megaraid/megaraid_sas.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/scsi/megaraid/megaraid_sas.c b/drivers/scsi/megaraid/megaraid_sas.c
--- a/drivers/scsi/megaraid/megaraid_sas.c
+++ b/drivers/scsi/megaraid/megaraid_sas.c
@@ -1615,7 +1615,7 @@ static int megasas_create_frame_pool(str
 	 * Calculated the number of 64byte frames required for SGL
 	 */
 	sgl_sz = sge_sz * instance->max_num_sge;
-	frame_count = (sgl_sz + MEGAMFI_FRAME_SIZE - 1) / MEGAMFI_FRAME_SIZE;
+	frame_count = DIV_ROUND_UP(sgl_sz, MEGAMFI_FRAME_SIZE);
 
 	/*
 	 * We need one extra frame for the MFI command
