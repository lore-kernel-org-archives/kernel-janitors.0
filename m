From: Julia Lawall <julia@diku.dk>
Date: Sun, 12 Jul 2009 20:06:00 +0000
Subject: [PATCH 5/5] net/irda: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907122205340.22658@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org, irda-users@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The result of container_of should not be NULL.  In particular, in this case
the argument to the enclosing function has passed though INIT_WORK, which
dereferences it, implying that its container cannot be NULL.

A simplified version of the semantic patch that makes this change is as
follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
identifier fn,work,x,fld;
type T;
expression E1,E2;
statement S;
@@

static fn(struct work_struct *work) {
  ... when != work = E1
  x = container_of(work,T,fld)
  ... when != x = E2
- if (x = NULL) S
  ...
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/irda/irnet/irnet_irda.c         |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/net/irda/irnet/irnet_irda.c b/net/irda/irnet/irnet_irda.c
index cf9a4b5..49ed80d 100644
--- a/net/irda/irnet/irnet_irda.c
+++ b/net/irda/irnet/irnet_irda.c
@@ -21,8 +21,6 @@ static void irnet_ppp_disconnect(struct work_struct *work)
 	irnet_socket * self  		container_of(work, irnet_socket, disconnect_work);
 
-	if (self = NULL)
-		return;
 	/*
 	 * If we were connected, cleanup & close the PPP
 	 * channel, which will kill pppd (hangup) and the rest.
