From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:20:09 +0000
Subject: [PATCH 11/42] drivers/ieee1394: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052219530.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

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

---
 drivers/ieee1394/ohci1394.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ieee1394/ohci1394.c b/drivers/ieee1394/ohci1394.c
index d0dc1db..5081502 100644
--- a/drivers/ieee1394/ohci1394.c
+++ b/drivers/ieee1394/ohci1394.c
@@ -1106,7 +1106,7 @@ static int ohci_iso_recv_init(struct hpsb_iso *iso)
 		if (recv->block_irq_interval * 4 > iso->buf_packets)
 			recv->block_irq_interval = iso->buf_packets / 4;
 		if (recv->block_irq_interval < 1)
-		recv->block_irq_interval = 1;
+			recv->block_irq_interval = 1;
 
 		/* choose a buffer stride */
 		/* must be a power of 2, and <= PAGE_SIZE */
