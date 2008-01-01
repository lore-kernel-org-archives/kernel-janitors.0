From: Julia Lawall <julia@diku.dk>
Date: Tue, 01 Jan 2008 21:07:04 +0000
Subject: [PATCH] net/x25: Add missing x25_neigh_put
Message-Id: <Pine.LNX.4.64.0801012206090.19803@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eis@baty.hanse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The function x25_get_neigh increments a reference count.  At the point of
the second goto out, the result of calling x25_get_neigh is only stored in
a local variable, and thus no one outside the function will be able to
decrease the reference count.  Thus, x25_neigh_put should be called before
the return in this case.


The problem was found using the following semantic match.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* if ((E = x25_get_neigh(...)) = NULL)
  S
  ... when != x25_neigh_put(...,(T1)E,...)
      when != if (E != NULL) { ... x25_neigh_put(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != x25_neigh_put(...,(T2)E,...)
        when != if (E != NULL) { ... x25_neigh_put(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/net/x25/x25_forward.c b/net/x25/x25_forward.c
--- a/net/x25/x25_forward.c	2008-01-01 09:49:39.000000000 +0100
+++ b/net/x25/x25_forward.c	2008-01-01 14:26:05.000000000 +0100
@@ -118,13 +118,14 @@ int x25_forward_data(int lci, struct x25
 		goto out;
 
 	if ( (skbn = pskb_copy(skb, GFP_ATOMIC)) = NULL){
-		goto out;
+		goto output;
 
 	}
 	x25_transmit_link(skbn, nb);
 
-	x25_neigh_put(nb);
 	rc = 1;
+output:
+	x25_neigh_put(nb);
 out:
 	return rc;
 }
