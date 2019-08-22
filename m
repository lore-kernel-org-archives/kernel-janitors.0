From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 14:52:55 +0000
Subject: =?UTF-8?Q?=5bPATCH_1/2=5d_ipc/mqueue=3a_Delete_an_unnecessary_check?= =?UTF-8?B?IGJlZm9yZSB0aGUgbWFj
Message-Id: <07477187-63e5-cc80-34c1-32dd16b38e12@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6e9378d1-3b9b-e138-53f6-bc5683ac8b8c@web.de>
In-Reply-To: <6e9378d1-3b9b-e138-53f6-bc5683ac8b8c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, Kees Cook <keescook@chromium.org>, Li Rongqing <lirongqing@baidu.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 14:07:57 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ipc/mqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 7a5a8edc3de3..494ab78863f4 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -1334,7 +1334,7 @@ static int do_mq_notify(mqd_t mqdes, const struct sigevent *notification)
 out:
 	if (sock)
 		netlink_detachskb(sock, nc);
-	else if (nc)
+	else
 		dev_kfree_skb(nc);

 	return ret;
--
2.23.0
