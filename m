From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Aug 2008 15:15:26 +0000
Subject: [PATCH 8/10] drivers/scsi: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0808021715060.20095@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/scsi/esp_scsi.c              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -1464,7 +1464,7 @@ static void esp_msgin_sdtr(struct esp *e
 
 		one_clock = esp->ccycle / 1000;
 		rounded_up = (period << 2);
-		rounded_up = (rounded_up + one_clock - 1) / one_clock;
+		rounded_up = DIV_ROUND_UP(rounded_up, one_clock);
 		stp = rounded_up;
 		if (stp && esp->rev >= FAS236) {
 			if (stp >= 50)
