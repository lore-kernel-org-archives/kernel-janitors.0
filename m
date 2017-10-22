From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 22 Oct 2017 08:28:31 +0000
Subject: [PATCH] mtd: lpddr: Fix a potential double mutex_lock
Message-Id: <20171022082831.26560-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'chip->state = FL_SYNCING', we will 'goto retry' with the mutex
'&shared->lock' already taken.
In such a case, the 'mutex_lock' at line 927 can never succeed.

In order to avoid a deadlock, move the 'mutex_lock(&shared->lock)' at the
very end of the block.

This has been spotted with the following coccinelle script:

@find@
expression x, t;
@@

	mutex_lock(x);
	... when != mutex_unlock(x)
	mutex_lock(t);

@@
expression find.t;
expression find.x;
@@

*	mutex_lock(t);
	... when != mutex_unlock(t)
*	mutex_lock(x);


Fixes: 	c68264711ca6 ("[MTD] LPDDR Command set driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Review carefuly, untested.
---
 drivers/mtd/lpddr/lpddr_cmds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 018c75faadb3..830dd0855ab3 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -237,7 +237,6 @@ static int get_chip(struct map_info *map, struct flchip *chip, int mode)
 				mutex_unlock(&contender->mutex);
 				return ret;
 			}
-			mutex_lock(&shared->lock);
 
 			/* We should not own chip if it is already in FL_SYNCING
 			 * state. Put contender and retry. */
@@ -247,6 +246,8 @@ static int get_chip(struct map_info *map, struct flchip *chip, int mode)
 				goto retry;
 			}
 			mutex_unlock(&contender->mutex);
+
+			mutex_lock(&shared->lock);
 		}
 
 		/* Check if we have suspended erase on this chip.
-- 
2.14.1

