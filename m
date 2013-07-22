From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 06:53:27 +0000
Subject: [patch] fsnotify: potential use after free
Message-Id: <20130722065327.GA14617@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: Eric Paris <eparis@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that if we drop the last reference then it
would be a use after free.  I don't know if it's possible, but really
the atomic_dec(&group->num_marks); should be done while we are holding a
reference to "group".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/notify/mark.c b/fs/notify/mark.c
index 923fe4a..27e357e 100644
--- a/fs/notify/mark.c
+++ b/fs/notify/mark.c
@@ -262,9 +262,9 @@ int fsnotify_add_mark_locked(struct fsnotify_mark *mark,
 err:
 	mark->flags &= ~FSNOTIFY_MARK_FLAG_ALIVE;
 	list_del_init(&mark->g_list);
+	atomic_dec(&group->num_marks);
 	fsnotify_put_group(group);
 	mark->group = NULL;
-	atomic_dec(&group->num_marks);
 
 	spin_unlock(&mark->lock);
 
