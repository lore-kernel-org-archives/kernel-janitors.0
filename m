From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:19 +0000
Subject: [PATCH 12/15] fs/notify/inotify/inotify_fsnotify.c: removes unnecessary semicolon
Message-Id: <1347469402-27557-12-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John McCutchan <john@johnmccutchan.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Robert Love <rlove@rlove.org>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 fs/notify/inotify/inotify_fsnotify.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 871569c..0cd3919 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -63,7 +63,7 @@ static bool event_compare(struct fsnotify_event *old, struct fsnotify_event *new
 			else if (old->mask & FS_IN_IGNORED)
 				return false;
 			return true;
-		};
+		}
 	}
 	return false;
 }

