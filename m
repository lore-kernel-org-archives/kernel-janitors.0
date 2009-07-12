From: Julia Lawall <julia@diku.dk>
Date: Sun, 12 Jul 2009 20:04:13 +0000
Subject: [PATCH 2/5] drivers/char: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907122203430.22658@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/char/pcmcia/synclink_cs.c |    3 ---
 drivers/char/synclink.c           |    3 ---
 drivers/char/synclinkmp.c         |    3 ---
 3 files changed, 9 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 77b3648..376d423 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -825,9 +825,6 @@ static void bh_handler(struct work_struct *work)
 	struct tty_struct *tty;
 	int action;
 
-	if (!info)
-		return;
-
 	if (debug_level >= DEBUG_LEVEL_BH)
 		printk( "%s(%d):bh_handler(%s) entry\n",
 			__FILE__,__LINE__,info->device_name);
diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index afded3a..5368560 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -1062,9 +1062,6 @@ static void mgsl_bh_handler(struct work_struct *work)
 		container_of(work, struct mgsl_struct, task);
 	int action;
 
-	if (!info)
-		return;
-		
 	if ( debug_level >= DEBUG_LEVEL_BH )
 		printk( "%s(%d):mgsl_bh_handler(%s) entry\n",
 			__FILE__,__LINE__,info->device_name);
diff --git a/drivers/char/synclinkmp.c b/drivers/char/synclinkmp.c
index 6f727e3..67633dd 100644
--- a/drivers/char/synclinkmp.c
+++ b/drivers/char/synclinkmp.c
@@ -2014,9 +2014,6 @@ static void bh_handler(struct work_struct *work)
 	SLMP_INFO *info = container_of(work, SLMP_INFO, task);
 	int action;
 
-	if (!info)
-		return;
-
 	if ( debug_level >= DEBUG_LEVEL_BH )
 		printk( "%s(%d):%s bh_handler() entry\n",
 			__FILE__,__LINE__,info->device_name);
