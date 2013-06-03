From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Jun 2013 09:27:25 +0000
Subject: [patch] fanotify: info leak in copy_event_to_user()
Message-Id: <20130603092725.GE16171@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->reserverd field isn't cleared so we leak one byte of stack
information to userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 6c80083..77cc85d 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -122,6 +122,7 @@ static int fill_event_metadata(struct fsnotify_group *group,
 	metadata->event_len = FAN_EVENT_METADATA_LEN;
 	metadata->metadata_len = FAN_EVENT_METADATA_LEN;
 	metadata->vers = FANOTIFY_METADATA_VERSION;
+	metadata->reserved = 0;
 	metadata->mask = event->mask & FAN_ALL_OUTGOING_EVENTS;
 	metadata->pid = pid_vnr(event->tgid);
 	if (unlikely(event->mask & FAN_Q_OVERFLOW))
