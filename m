From: Julien Brunel <brunel@diku.dk>
Date: Fri, 08 Aug 2008 11:55:21 +0000
Subject: [PATCH] net/rxrpc: Use an IS_ERR test rather than a NULL test
Message-Id: <200808081355.21787.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function rxrpc_get_transport returns an ERR
pointer, but never returns a NULL pointer. So after a call to this
function, a NULL test should be replaced by an IS_ERR test.

A simplified version of the semantic patch that makes this change is
as follows: 
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@correct_null_test@
expression x,E;
statement S1, S2;
@@
x =  rxrpc_get_transport(...)
<... when != x = E
if (
(
- x@p2 != NULL
+ ! IS_ERR ( x )
|
- x@p2 = NULL
+ IS_ERR( x )
)
 )
S1
else S2
...>
? x = E;
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 net/rxrpc/ar-accept.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/net/rxrpc/ar-accept.c b/net/rxrpc/ar-accept.c
--- a/net/rxrpc/ar-accept.c
+++ b/net/rxrpc/ar-accept.c
@@ -100,7 +100,7 @@ static int rxrpc_accept_incoming_call(st
 
 	trans = rxrpc_get_transport(local, peer, GFP_NOIO);
 	rxrpc_put_peer(peer);
-	if (!trans) {
+	if (IS_ERR(trans)) {
 		_debug("no trans");
 		ret = -EBUSY;
 		goto error;
