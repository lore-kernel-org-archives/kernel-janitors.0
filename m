From: Julia Lawall <julia@diku.dk>
Date: Mon, 13 Jul 2009 10:10:32 +0000
Subject: [PATCH 2/2] net/irda/ircomm: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907131210070.6808@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org, irda-users@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The result of container_of should not be NULL.  In particular, in this case
the argument to the enclosing function has passed though INIT_WORK,
which dereferences it, implying that its container cannot be NULL.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression x,e;
@@

x = container_of(...)
... when != x = e
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/irda/ircomm/ircomm_tty.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/irda/ircomm/ircomm_tty.c b/net/irda/ircomm/ircomm_tty.c
index 811984d..6306c19 100644
--- a/net/irda/ircomm/ircomm_tty.c
+++ b/net/irda/ircomm/ircomm_tty.c
@@ -609,7 +609,7 @@ static void ircomm_tty_do_softint(struct work_struct *work)
 
 	IRDA_DEBUG(2, "%s()\n", __func__ );
 
-	if (!self || self->magic != IRCOMM_TTY_MAGIC)
+	if (self->magic != IRCOMM_TTY_MAGIC)
 		return;
 
 	tty = self->tty;
