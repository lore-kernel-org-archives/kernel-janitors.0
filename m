From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:28:12 +0000
Subject: [PATCH 37/42] drivers/net/hamradio: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052227520.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Klaus Kudielka <klaus.kudielka@ieee.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/net/hamradio/scc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index 9f64c86..3365581 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -1069,7 +1069,8 @@ static void scc_tx_done(struct scc_channel *scc)
 		case KISS_DUPLEX_LINK:
 			scc->stat.tx_state = TXS_IDLE2;
 			if (scc->kiss.idletime != TIMER_OFF)
-			scc_start_tx_timer(scc, t_idle, scc->kiss.idletime*100);
+				scc_start_tx_timer(scc, t_idle,
+						   scc->kiss.idletime*100);
 			break;
 		case KISS_DUPLEX_OPTIMA:
 			scc_notify(scc, HWEV_ALL_SENT);
