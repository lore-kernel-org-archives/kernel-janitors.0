From: Julia Lawall <julia@diku.dk>
Date: Sun, 12 Jul 2009 20:03:42 +0000
Subject: [PATCH 1/5] drivers/char/hvc_console.c: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907122203060.22658@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/char/hvc_console.c          |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hvc_console.c b/drivers/char/hvc_console.c
index 94e7e3c..e367630 100644
--- a/drivers/char/hvc_console.c
+++ b/drivers/char/hvc_console.c
@@ -516,8 +516,6 @@ static void hvc_set_winsz(struct work_struct *work)
 	struct winsize ws;
 
 	hp = container_of(work, struct hvc_struct, tty_resize);
-	if (!hp)
-		return;
 
 	spin_lock_irqsave(&hp->lock, hvc_flags);
 	if (!hp->tty) {
