From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 14:54:53 +0000
Subject: [PATCH 2/2] ipc/mqueue: Improve exception handling in do_mq_notify()
Message-Id: <592ef10e-0b69-72d0-9789-fc48f638fdfd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6e9378d1-3b9b-e138-53f6-bc5683ac8b8c@web.de>
In-Reply-To: <6e9378d1-3b9b-e138-53f6-bc5683ac8b8c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, Kees Cook <keescook@chromium.org>, Li Rongqing <lirongqing@baidu.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 16:21:17 +0200

Null pointers were assigned to local variables in a few cases
as exception handling. The jump target “out” was used where no meaningful
data processing actions should eventually be performed by branches of
an if statement then.
Use an additional jump target for calling dev_kfree_skb() directly.

Return also directly after error conditions were detected when no extra
clean-up is needed by this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ipc/mqueue.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 494ab78863f4..ad6c475eb370 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -1241,15 +1241,14 @@ static int do_mq_notify(mqd_t mqdes, const struct sigevent *notification)

 			/* create the notify skb */
 			nc = alloc_skb(NOTIFY_COOKIE_LEN, GFP_KERNEL);
-			if (!nc) {
-				ret = -ENOMEM;
-				goto out;
-			}
+			if (!nc)
+				return -ENOMEM;
+
 			if (copy_from_user(nc->data,
 					notification->sigev_value.sival_ptr,
 					NOTIFY_COOKIE_LEN)) {
 				ret = -EFAULT;
-				goto out;
+				goto free_skb;
 			}

 			/* TODO: add a header? */
@@ -1265,8 +1264,7 @@ static int do_mq_notify(mqd_t mqdes, const struct sigevent *notification)
 			fdput(f);
 			if (IS_ERR(sock)) {
 				ret = PTR_ERR(sock);
-				sock = NULL;
-				goto out;
+				goto free_skb;
 			}

 			timeo = MAX_SCHEDULE_TIMEOUT;
@@ -1275,11 +1273,8 @@ static int do_mq_notify(mqd_t mqdes, const struct sigevent *notification)
 				sock = NULL;
 				goto retry;
 			}
-			if (ret) {
-				sock = NULL;
-				nc = NULL;
-				goto out;
-			}
+			if (ret)
+				return ret;
 		}
 	}

@@ -1335,6 +1330,7 @@ static int do_mq_notify(mqd_t mqdes, const struct sigevent *notification)
 	if (sock)
 		netlink_detachskb(sock, nc);
 	else
+free_skb:
 		dev_kfree_skb(nc);

 	return ret;
--
2.23.0
