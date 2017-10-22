From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 22 Oct 2017 08:23:01 +0000
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix a potential double mutex_lock
Message-Id: <20171022082301.26220-1-christophe.jaillet@wanadoo.fr>
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


Fixes: 3afe7eb37f4d ("[MTD] [NOR] fix cfi_cmdset_0001 FL_SYNCING race (take 2)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Review carefuly, untested.
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5e1b68cbcd0a..bddf407a366d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -952,7 +952,6 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				mutex_unlock(&contender->mutex);
 				return ret;
 			}
-			mutex_lock(&shared->lock);
 
 			/* We should not own chip if it is already
 			 * in FL_SYNCING state. Put contender and retry. */
@@ -962,6 +961,8 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				goto retry;
 			}
 			mutex_unlock(&contender->mutex);
+
+			mutex_lock(&shared->lock);
 		}
 
 		/* Check if we already have suspended erase
-- 
2.14.1

