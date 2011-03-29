From: Dan Carpenter <error27@gmail.com>
Date: Tue, 29 Mar 2011 03:25:29 +0000
Subject: [patch 1/2] ceph: null deref on allocation failure
Message-Id: <20110329032529.GE9856@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code checked "event_work" for allocation failures, but only
after it had already use it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/ceph/osd_client.c b/net/ceph/osd_client.c
index 02212ed..b6776cb 100644
--- a/net/ceph/osd_client.c
+++ b/net/ceph/osd_client.c
@@ -1602,11 +1602,11 @@ void handle_watch_notify(struct ceph_osd_client *osdc, struct ceph_msg *msg)
 	     cookie, ver, event);
 	if (event) {
 		event_work = kmalloc(sizeof(*event_work), GFP_NOIO);
-		INIT_WORK(&event_work->work, do_event_work);
 		if (!event_work) {
 			dout("ERROR: could not allocate event_work\n");
 			goto done_err;
 		}
+		INIT_WORK(&event_work->work, do_event_work);
 		event_work->event = event;
 		event_work->ver = ver;
 		event_work->notify_id = notify_id;
