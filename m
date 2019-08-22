From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 14:50:45 +0000
Subject: [PATCH 0/2] ipc/mqueue: Adjustments for do_mq_notify()
Message-Id: <6e9378d1-3b9b-e138-53f6-bc5683ac8b8c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, Kees Cook <keescook@chromium.org>, Li Rongqing <lirongqing@baidu.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 16:38:49 +0200
Subject: [PATCH 0/2] ipc/mqueue: Adjustments for do_mq_notify()

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary check before the macro call “dev_kfree_skb”
  Improve exception handling in do_mq_notify()

 ipc/mqueue.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

--
2.23.0
