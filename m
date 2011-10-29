From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Oct 2011 07:18:54 +0000
Subject: [patch] CIFS: double unlock in cifs_lock_add_if()
Message-Id: <20111029071854.GA17780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Pavel Shilovsky <piastry-7qunaywFIewox3rIn2DAYQ@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We unlocked "cinode->lock_mutex" twice so I've removed the first
unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index ea096ce..b8dbab8 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -775,11 +775,9 @@ try_again:
 					(lock->blist.next = &lock->blist));
 		if (!rc)
 			goto try_again;
-		else {
-			mutex_lock(&cinode->lock_mutex);
-			list_del_init(&lock->blist);
-			mutex_unlock(&cinode->lock_mutex);
-		}
+
+		mutex_lock(&cinode->lock_mutex);
+		list_del_init(&lock->blist);
 	}
 
 	kfree(lock);
