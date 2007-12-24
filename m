From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:42:24 +0000
Subject: [PATCH 24/38] fs/autofs: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241542010.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hpa@zytor.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The functions time_before, time_before_eq, time_after, and time_after_eq
are more robust for comparing jiffies against other values.

A simplified version of the semantic patch making this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ change_compare_np @
expression E;
@@

(
- jiffies <= E
+ time_before_eq(jiffies,E)
|
- jiffies >= E
+ time_after_eq(jiffies,E)
|
- jiffies < E
+ time_before(jiffies,E)
|
- jiffies > E
+ time_after(jiffies,E)
)

@ include depends on change_compare_np @
@@

#include <linux/jiffies.h>

@ no_include depends on !include && change_compare_np @
@@

  #include <linux/...>
+ #include <linux/jiffies.h>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -r -u -p a/fs/autofs/dirhash.c b/fs/autofs/dirhash.c
--- a/fs/autofs/dirhash.c	2006-11-30 19:05:26.000000000 +0100
+++ b/fs/autofs/dirhash.c	2007-12-23 20:30:39.000000000 +0100
@@ -47,7 +47,7 @@ struct autofs_dir_ent *autofs_expire(str
 			return NULL;	/* No entries */
 		/* We keep the list sorted by last_usage and want old stuff */
 		ent = list_entry(dh->expiry_head.next, struct autofs_dir_ent, exp);
-		if (jiffies - ent->last_usage < timeout)
+		if (time_before(jiffies, ent->last_usage + timeout))
 			break;
 		/* Move to end of list in case expiry isn't desirable */
 		autofs_update_usage(dh, ent);
