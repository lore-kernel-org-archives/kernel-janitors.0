From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:19:00 +0000
Subject: [PATCH 7/42] net/atm: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052218400.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following an if.

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
 net/atm/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/atm/common.c b/net/atm/common.c
index 940404a..1b9c52a 100644
--- a/net/atm/common.c
+++ b/net/atm/common.c
@@ -792,7 +792,7 @@ int vcc_getsockopt(struct socket *sock, int level, int optname,
 	default:
 		if (level = SOL_SOCKET)
 			return -EINVAL;
-			break;
+		break;
 	}
 	if (!vcc->dev || !vcc->dev->ops->getsockopt)
 		return -EINVAL;
