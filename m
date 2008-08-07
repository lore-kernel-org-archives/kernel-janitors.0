From: Julien Brunel <brunel@diku.dk>
Date: Thu, 07 Aug 2008 15:15:53 +0000
Subject: [PATCH] drivers/infiniband/core: Use an IS_ERR test rather than a NULL test
Message-Id: <200808071715.54004.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function ib_create_send_mad returns an ERR pointer,
but never returns a NULL pointer. So after a call to this function,
a NULL test should be replaced by an IS_ERR test.

A simplified version of the semantic patch that makes this change is
as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@correct_null_test@
expression x,E;
statement S1, S2;
@@
x = ib_create_send_mad(...)
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
 drivers/infiniband/core/mad_rmpp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/infiniband/core/mad_rmpp.c 
b/drivers/infiniband/core/mad_rmpp.c
--- a/drivers/infiniband/core/mad_rmpp.c
+++ b/drivers/infiniband/core/mad_rmpp.c
@@ -133,7 +133,7 @@ static void ack_recv(struct mad_rmpp_rec
 	msg = ib_create_send_mad(&rmpp_recv->agent->agent, recv_wc->wc->src_qp,
 				 recv_wc->wc->pkey_index, 1, hdr_len,
 				 0, GFP_KERNEL);
-	if (!msg)
+	if (IS_ERR(msg))
 		return;
 
 	format_ack(msg, (struct ib_rmpp_mad *) recv_wc->recv_buf.mad, rmpp_recv);
