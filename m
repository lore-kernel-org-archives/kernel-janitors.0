From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:20:26 +0000
Subject: [PATCH 12/42] drivers/char/synclink.c: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052220100.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/char/synclink.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index a2a5800..b7ac730 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -6637,7 +6637,7 @@ static bool mgsl_get_rx_frame(struct mgsl_struct *info)
 			unsigned char *ptmp = info->intermediate_rxbuffer;
 
 			if ( !(status & RXSTATUS_CRC_ERROR))
-			info->icount.rxok++;
+				info->icount.rxok++;
 			
 			while(copy_count) {
 				int partial_count;
