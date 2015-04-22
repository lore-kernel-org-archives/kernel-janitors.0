From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2015 13:39:00 +0000
Subject: [patch] kdbus: checking for IS_ERR() instead of NULL
Message-Id: <20150422133900.GB29383@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"e->user" is never assigned an ERR_PTR().  It can be set to NULL so I
assume that is what is intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/ipc/kdbus/queue.c b/ipc/kdbus/queue.c
index a449464..21fce62 100644
--- a/ipc/kdbus/queue.c
+++ b/ipc/kdbus/queue.c
@@ -637,7 +637,7 @@ int kdbus_queue_entry_move(struct kdbus_queue_entry *e,
 	lockdep_assert_held(&src->lock);
 	lockdep_assert_held(&dst->lock);
 
-	if (WARN_ON(IS_ERR(e->user)) || WARN_ON(list_empty(&e->entry)))
+	if (WARN_ON(!e->user) || WARN_ON(list_empty(&e->entry)))
 		return -EINVAL;
 	if (src = dst)
 		return 0;
