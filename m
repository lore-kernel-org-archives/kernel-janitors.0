From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:39:48 +0000
Subject: [PATCH net] net: atm: clean up a range check
Message-Id: <20190503123948.GD29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, David Woodhouse <dwmw2@infradead.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The code works fine but the problem is that check for negatives is a
no-op:

	if (arg < 0)
		i = 0;

The "i" value isn't used.  We immediately overwrite it with:

	i = array_index_nospec(arg, MAX_LEC_ITF);

The array_index_nospec() macro returns zero if "arg" is out of bounds so
this works, but the dead code is confusing and it doesn't look very
intentional.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This applies to net, but it's just a clean up.

 net/atm/lec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/atm/lec.c b/net/atm/lec.c
index ad4f829193f0..a0311493b01b 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -726,9 +726,7 @@ static int lecd_attach(struct atm_vcc *vcc, int arg)
 	struct lec_priv *priv;
 
 	if (arg < 0)
-		i = 0;
-	else
-		i = arg;
+		arg = 0;
 	if (arg >= MAX_LEC_ITF)
 		return -EINVAL;
 	i = array_index_nospec(arg, MAX_LEC_ITF);
-- 
2.18.0
