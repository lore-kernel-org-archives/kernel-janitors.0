From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 25 Jan 2021 16:14:09 +0000
Subject: [PATCH] watch_queue: rectify kernel-doc for init_watch()
Message-Id: <20210125161409.8478-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The command './scripts/kernel-doc -none kernel/watch_queue.c'
reported a mismatch in the kernel-doc of init_watch().

Rectify the kernel-doc, such that no issues remain for watch_queue.c.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.11-rc5 and next-20210122

David, please pick this minor kernel-doc fixup.

 kernel/watch_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 0ef8f65bd2d7..9c9eb20dd2c5 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -413,7 +413,7 @@ static void put_watch(struct watch *watch)
 }
 
 /**
- * init_watch_queue - Initialise a watch
+ * init_watch - Initialise a watch
  * @watch: The watch to initialise.
  * @wqueue: The queue to assign.
  *
-- 
2.17.1
