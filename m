From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:03:54 +0000
Subject: [patch] dlm: cleanup remove unused code
Message-Id: <20100322120354.GB21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>, Steven Whitehouse <swhiteho@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains because "lkb" is never NULL.  Looking at it, the original
code actually adds the new element to the end of the list fine, so we can
just get rid of the if condition.  This code is four years old and no one
has complained so it must work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 46ffd3e..f162de5 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -732,10 +732,7 @@ static void lkb_add_ordered(struct list_head *new, struct list_head *head,
 		if (lkb->lkb_rqmode < mode)
 			break;
 
-	if (!lkb)
-		list_add_tail(new, head);
-	else
-		__list_add(new, lkb->lkb_statequeue.prev, &lkb->lkb_statequeue);
+	__list_add(new, lkb->lkb_statequeue.prev, &lkb->lkb_statequeue);
 }
 
 /* add/remove lkb to rsb's grant/convert/wait queue */
