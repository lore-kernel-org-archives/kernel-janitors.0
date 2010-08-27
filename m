From: Chris Ball <cjb@laptop.org>
Date: Fri, 27 Aug 2010 21:08:26 +0000
Subject: [PATCH RESEND] drivers/mmc/host: Adjust confusing if indentation
Message-Id: <20100827210826.GB27804@void.printf.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052219360.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052219360.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Andrew, doesn't look like anyone else has taken this yet.

From: Julia Lawall <julia@diku.dk>
Date: Thu, 5 Aug 2010 22:19:52 +0200 (CEST)

Move the second if (reg & ...) test into the branch indicated by its
indentation.  The test was previously always executed after the if
containing that branch, but it was always false unless the if branch was
taken.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Chris Ball <cjb@laptop.org>
---
 drivers/mmc/host/imxmmc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/imxmmc.c b/drivers/mmc/host/imxmmc.c
index 9a68ff4..5a950b1 100644
--- a/drivers/mmc/host/imxmmc.c
+++ b/drivers/mmc/host/imxmmc.c
@@ -148,11 +148,12 @@ static int imxmci_start_clock(struct imxmci_host *host)
 
 		while (delay--) {
 			reg = readw(host->base + MMC_REG_STATUS);
-			if (reg & STATUS_CARD_BUS_CLK_RUN)
+			if (reg & STATUS_CARD_BUS_CLK_RUN) {
 				/* Check twice before cut */
 				reg = readw(host->base + MMC_REG_STATUS);
 				if (reg & STATUS_CARD_BUS_CLK_RUN)
 					return 0;
+			}
 
 			if (test_bit(IMXMCI_PEND_STARTED_b, &host->pending_events))
 				return 0;


-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
