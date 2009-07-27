From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:12:34 +0000
Subject: [PATCH 1/12] drivers/atm: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271812130.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

str has already been tested.  It seems that this test should be on the
recently returned value snr.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
@@

if (x = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/atm/solos-pci.c             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/atm/solos-pci.c b/drivers/atm/solos-pci.c
index 9359613..307321b 100644
--- a/drivers/atm/solos-pci.c
+++ b/drivers/atm/solos-pci.c
@@ -372,7 +372,7 @@ static int process_status(struct solos_card *card, int port, struct sk_buff *skb
 	}
 
 	snr = next_string(skb);
-	if (!str)
+	if (!snr)
 		return -EIO;
 	attn = next_string(skb);
 	if (!attn)
